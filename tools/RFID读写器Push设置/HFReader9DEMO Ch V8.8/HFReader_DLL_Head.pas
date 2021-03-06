unit HFReader_DLL_Head;

interface

Const

    RR9001_DLLName = 'HFReader9.dll'; // 'RR9000EXT.DLL'

type
    RTempRecord=Record
    end;

    //==========================================================================================//
     Function OpenNetPort(Port : LongInt;
                    IPaddr:string;
                     var ComAdr : byte;
                     var frmcomportindex:longint): LongInt; stdcall;external RR9001_DLLName ;
    Function CloseNetPort( frmComPortindex : longint ): LongInt; stdcall; external RR9001_DLLName ;

    Function OpenComPort(Port : LongInt;var ComAdr : byte;Baud:byte; var frmcomportindex: longint): LongInt; stdcall; external RR9001_DLLName ;
    Function CloseComPort(  ): LongInt; stdcall;external RR9001_DLLName ;
    Function AutoOpenComPort(var Port : longint; var ComAdr : byte;Baud:byte; var frmComPortindex :longint ) : LongInt; stdcall; external RR9001_DLLName ;
        //=======================2007-4-23
    Function CloseSpecComPort( frmComPortindex : longint ): LongInt; stdcall;external RR9001_DLLName ;

    //==========================================================================================//
    Function Inventory(var ComAdr : byte; var State : byte;  var AFI : byte;
                       DSFIDAndUID : pchar;  var CardNum : byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;
    Function GetInventoryTime(Var m_Time: longint;
                      frmComPortindex: longint): LongInt; Stdcall;external RR9001_DLLName ;
    Function StayQuiet(var ComAdr : byte; UID : pchar; var ErrorCode : byte; frmComPortindex : longint): LongInt; stdcall;external RR9001_DLLName ;

    Function ReadSingleBlock(var ComAdr : byte; var State : byte; UID : pchar;
                             BlockNum : byte; Var BlockSecStatus : Byte;
                             Data : pchar; var ErrorCode: byte;
                             frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;

    //--------------------------2006--8-3 // 2006-8-10
     Function ReadMultipleBlock(var ComAdr : byte;
                             var State : byte;
                             UID : pchar;
                              BlockNum : byte;
                              BlockCount :byte;
                              BlockSecStatus : pchar;
                             Data : pchar;
                             var ErrorCode: byte;
                             frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;
                                
     //--------------------------2006-8-3  // 2006-8-10
     //===============================================
    Function WriteSingleBlock(var ComAdr : byte;var State : byte; UID : pchar;
                              BlockNum : byte; Data : pchar;
                              var ErrorCode : byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;

    Function LockBlock(var ComAdr : byte; var State : byte; UID : pchar;
                       BlockNum : byte; var ErrorCode : byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;

    Function Select(var ComAdr : byte;UID : pchar; var ErrorCode : byte; frmComPortindex : longint): LongInt; stdcall;external RR9001_DLLName ;

    Function ResetToReady(var ComAdr : byte; var State : byte; UID : pchar;
                          var ErrorCode : byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;

    Function WriteAFI(var ComAdr : byte;var State : byte; UID : pchar;
                      AFI : byte;  var ErrorCode : byte; frmComPortindex : longint): LongInt; stdcall;external RR9001_DLLName ;

    Function LockAFI(var ComAdr : byte; var State : byte; UID : pchar;
                     var ErrorCode : byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;

    Function WriteDSFID(var ComAdr : byte; var State : byte; UID : pchar;
                        DSFID : byte; var ErrorCode : byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;

    Function LockDSFID(var ComAdr : byte;var State : byte; UID : pchar;
                       var ErrorCode : byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;

    Function GetSystemInformation(var ComAdr : byte;   var State : byte;
                                  UIDI : pchar;  var InformationFlag : byte;
                                  UIDO : pchar;  var DSFID : byte;
                                  var AFI : byte; MemorySize : pchar;
                                  var ICReference : Byte;
                                  var ErrorCode : byte; frmComPortindex : longint): LongInt; stdcall;external RR9001_DLLName ;

    //==========================================================================================//
    Function GetReaderInformation(var ComAdr : byte;   VersionInfo : pchar;
                                  var ReaderType : Byte; TrType : pchar;
                                  var InventoryScanTime : Byte; frmComPortindex : longint): LongInt; stdcall;external RR9001_DLLName ;

    Function OpenRf(var ComAdr : byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;
    Function CloseRf(var ComAdr : byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;
    Function WriteComAdr(var ComAdr : byte; var ComAdrData : Byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;
    Function WriteInventoryScanTime(var ComAdr : byte; var InventoryScanTime : Byte; frmComPortindex : longint): LongInt; stdcall;external RR9001_DLLName ;


    Function SetGeneralOutput(var ComAdr : byte; var _Output : Byte; frmComPortindex : longint): LongInt; stdcall;  external RR9001_DLLName ;
    Function GetGeneralInput(var ComAdr : byte;  var _Input : Byte; frmComPortindex : longint): LongInt; stdcall;   external RR9001_DLLName ;
    Function SetRelay(var ComAdr : byte; var _Relay : Byte; frmComPortindex : longint): LongInt; stdcall;  external RR9001_DLLName ;

    //=============2006_10_26
     function  SetActiveANT(var ComAdr : byte;var _ANT_Status : Byte; frmComPortindex : longint):longint;stdcall;external RR9001_DLLName ;

     function GetANTStatus(var ComAdr : byte;var Get_ANT_Status : Byte; frmComPortindex : longint):longint;stdcall;external RR9001_DLLName ;


  Function SetUserDefinedBlockLength(var ComAdr : byte;var _Block_len : Byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;


  Function SetScanMode(var ComAdr : byte;
                       _Scan_Mode_Data :pchar; frmComPortindex : longint): LongInt; stdcall;external RR9001_DLLName ;


 Function ReadScanModeData(ScanModeData : pchar;
                           var ValidDatalength : longint; frmComPortindex : longint): LongInt;stdcall;external RR9001_DLLName ; //读取扫描模式的数据
//=====================================================================2006-11-24
Function  GetUserDefinedBlocklength(var ComAdr : Byte;
                                  var _Block_len : Byte; frmComPortindex : longint):longint;stdcall;external RR9001_DLLName ;
//==================================================================2006-12-8
Function GetScanModeStatus(var Comadr:byte;
                             _Scan_Mode_Status:pchar; frmComPortindex : longint):longint;stdcall;external RR9001_DLLName ;

//=====================================================================2006-12-8
Function CustomizedReadSingleBlock(var ComAdr : byte;
                                 var State : byte;
                                 UID : pchar;
                                  BlockNum : byte;
                                   DataBuffer : pchar;
                                var ErrorCode: byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;
//====================================================================2006-12-16
Function CustomizedWriteSingleBlock(var ComAdr : byte;
                              var State : byte;
                              UID : pchar;
                              BlockNum : byte;
                              Data : pchar;
                               ByteCount : byte;
                              var ErrorCode : byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;

//=========================================================================2006-12-16
Function CustomizedReadMultipleBlock(var ComAdr : byte;
                             var State : byte;
                             UID : pchar;
                             BlockNum : byte;
                             BlockCount : byte;
                             DataBuffer : pchar;
                             var ErrorCode: byte; frmComPortindex : longint): LongInt; stdcall;external RR9001_DLLName ;

//==========================================================================2006-12-16
Function SetAccessTime(var ComAdr : byte;
                       var AccessTime : Byte; frmComPortindex : longint): LongInt; stdcall;  external RR9001_DLLName ;


 Function GetAccessTime(var ComAdr : byte;
                       var AccessTimeRet : Byte; frmComPortindex : longint):longint;stdcall; external RR9001_DLLName ;
//=======================================================================2006-12-30
 Function SetReceiveChannel(var ComAdr : byte;
                       var ReceiveChannel : Byte; frmComPortindex : longint): LongInt; stdcall; external RR9001_DLLName ;

 function GetReceiveChannelStatus(var ComAdr : byte;
                          var ReceiveChannelStatus : Byte; frmComPortindex : longint):longint;stdcall;external RR9001_DLLName ;
//=======================================================================2006-12-30
     function  TransparentRead(var ComAdr:Byte;
                               RspLength:Byte;
                                CustomDatalength:Byte;
                                CustomData:pchar;
                            var  FeedbackDataLength :byte; 
                                 FeedbackData : pchar;
                              var ErrorCode: byte;
                              frmComPortindex : longint):longint;stdcall; external RR9001_DLLName ;

   function  TransparentWrite(var ComAdr:Byte;
                               option:pchar;
                              RspLength:Byte;
                             CustomDatalength:Byte;  
                               CustomData:pchar;
                             var  FeedbackDataLength :byte;
                                FeedbackData : pchar;
                              var ErrorCode: byte;
                              frmComPortindex : longint):longint;stdcall; external RR9001_DLLName ;

    function TransparentCustomizedCmd(var ComAdr:Byte;
                                      RspTime:pchar;
                                       RspLength:byte;
                                     CustomDataLength:byte; 
                                       CustomData:pchar;
                                    var  FeedbackDataLength :byte; 
                                       FeedbackData : pchar;
                                      var ErrorCode :byte;
                                      frmComPortindex : longint):longint;stdcall;external RR9001_DLLName ;
//=================================================================2007-5-22

   Function SetParseMode(var ComAdr : byte;
                       var _ParseMode : Byte;
                       frmComPortindex : longint): LongInt; stdcall;  external RR9001_DLLName ;
   Function GetParseMode(var ComAdr : byte;
                         var Get_ParseMode : Byte;
                         frmComPortindex : longint): LongInt; stdcall;  external RR9001_DLLName ;
//====================================================================2007-6-17
 function SetPwr(var ComAdr: byte ;
                var _Pwr: Byte;
                frmComPortindex: longint): LongInt; Stdcall; external RR9001_DLLName ;
  function SetPwrByValue(var ComAdr: byte ;
                var _PwrVal: Byte;
                frmComPortindex: longint): LongInt; Stdcall; external RR9001_DLLName ;
  function GetPwr(var ComAdr: byte ;
                var _Pwr: Byte;
                var _PwrVal: Byte;
                frmComPortindex: longint): LongInt; Stdcall; external RR9001_DLLName ;

  function CheckAntenna(var ComAdr: byte ;
                var _AntValid: Byte;
                frmComPortindex: longint): LongInt; Stdcall; external RR9001_DLLName ;

  function AdjustPwr(var ComAdr: byte ;
                var _DirStep: Byte;
                frmComPortindex: longint): LongInt; Stdcall; external RR9001_DLLName ;

  function CalibratePwr(var ComAdr: byte ;
                var _VRMS: Byte;
                frmComPortindex: longint): LongInt; Stdcall; external RR9001_DLLName ;

  function ProgramPwrTable(var ComAdr: byte ;
                _Pwr:Byte;
                _PwrVal:Byte;
                _VRMS:Byte;
                frmComPortindex: longint): LongInt; Stdcall; external RR9001_DLLName ;
  function SyncScan(var ComAdr: byte ;
                _Sync:Byte;
                frmComPortindex: longint): LongInt; Stdcall; external RR9001_DLLName ;
implementation


end.













