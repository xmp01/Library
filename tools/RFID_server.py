#!/usr/bin/env python
# -*- coding: utf-8 -*-

import SocketServer
from SocketServer import StreamRequestHandler as HD
import threading, logging
import time, os
import MySQLdb
log_file_path = os.getcwd()

host = 'localhost'
port = 2333

class Server(HD):
    def handle(self):
        pushDb = pushDB()
        print "waiting for connection"
        cnt = 1
        while True:
            data = self.request.recv(1024)
            if not data:
                break
            print data

            response = 'ok'
            self.request.send(response)
            pieces = data.split(';')
            print "Round{0}, the received data is {1}".format(str(cnt), pieces)
            cnt += 1
            for each in pieces:
                if not each: break
                ip_port, signal_code = each.split()
                ip, port = ip_port.split(':')
                print ip_port, signal_code
                now = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time()))
                sql = "insert into rfidrecord(action_date, signal_code, ip, is_deleted) values('{0}', '{1}', '{2}', {3})".format(now, signal_code, ip, '0')
                pushDb.push(sql)

        pushDb.db.close()

class pushDB:
    def __init__(self):
        self.host = "localhost"
        self.user = "root"
        self.password = ""
        self.port = 3306
        self.db = "library_atm"
        self.charset = "utf8"

        self.db = MySQLdb.connect(
            host=self.host,
            port = self.port,
            user = self.user,
            passwd = self.password,
            db = self.db,
            charset = self.charset
        )
        self.cursor = self.db.cursor()

    def push(self, sql):
        try:
            self.cursor.execute(sql)
            self.db.commit()
        except Exception, e:
            print e
            self.db.rollback()
        finally:
            pass

if __name__ == '__main__':
    server = SocketServer.ThreadingTCPServer((host, port), Server)
    server.serve_forever()
