#NoTrayIon
#include <Array.au3>

;~ Local $searchEdit[2] = [54, 128] ; wxWidght
;~ Local $addBtn[2] = [183, 426] ; wxWidght
Local $searchEdit[2] = [50, 112] ; QT
Local $addBtn[2] = [192, 395] ; QT

Local $title = "[TITLE:LINE]"

Local $dummy[1] = ["Dummy"]
;~ _ArrayAdd($dummy, "linegame01")
;~ _ArrayAdd($dummy, "linegame02")
;~ _ArrayAdd($dummy, "linegame03")
;~ _ArrayAdd($dummy, "linegame04")
;~ _ArrayAdd($dummy, "linegame05")
;~ _ArrayAdd($dummy, "linegame06")
;~ _ArrayAdd($dummy, "linegame07")
;~ _ArrayAdd($dummy, "linegame08")
;~ _ArrayAdd($dummy, "linegame09")
;~ _ArrayAdd($dummy, "linegame10")
;~ _ArrayAdd($dummy, "linegame11")
;~ _ArrayAdd($dummy, "linegame12")
;~ _ArrayAdd($dummy, "linegame13")
;~ _ArrayAdd($dummy, "linegame14")
;~ _ArrayAdd($dummy, "linegame15")
;~ _ArrayAdd($dummy, "linegame16")
;~ _ArrayAdd($dummy, "linegame17")
;~ _ArrayAdd($dummy, "linegame18")
;~ _ArrayAdd($dummy, "linegame19")
;~ _ArrayAdd($dummy, "linegame20")
;~ _ArrayAdd($dummy, "linegame21")
;~ _ArrayAdd($dummy, "linegame22")
;~ _ArrayAdd($dummy, "linegame23")
;~ _ArrayAdd($dummy, "linegame24")
;~ _ArrayAdd($dummy, "linegame25")
;~ _ArrayAdd($dummy, "linegame26")
;~ _ArrayAdd($dummy, "linegame27")
;~ _ArrayAdd($dummy, "linegame28")
;~ _ArrayAdd($dummy, "linegame29")
;~ _ArrayAdd($dummy, "linegame30")
;~ _ArrayAdd($dummy, "linegame31")
;~ _ArrayAdd($dummy, "linegame32")
;~ _ArrayAdd($dummy, "linegame33")
;~ _ArrayAdd($dummy, "linegame34")
;~ _ArrayAdd($dummy, "linegame35")
;~ _ArrayAdd($dummy, "linegame36")
;~ _ArrayAdd($dummy, "linegame37")
;~ _ArrayAdd($dummy, "linegame38")
;~ _ArrayAdd($dummy, "linegame39")
;~ _ArrayAdd($dummy, "linegame40")
;~ _ArrayAdd($dummy, "linegame41")
;~ _ArrayAdd($dummy, "linegame42")
;~ _ArrayAdd($dummy, "linegame43")
;~ _ArrayAdd($dummy, "linegame44")
;~ _ArrayAdd($dummy, "linegame45")
;~ _ArrayAdd($dummy, "linegame46")
;~ _ArrayAdd($dummy, "linegame47")
;~ _ArrayAdd($dummy, "linegame48")
;~ _ArrayAdd($dummy, "linegame49")
;~ _ArrayAdd($dummy, "linegame50")
;~ _ArrayAdd($dummy, "linepun001")
;~ _ArrayAdd($dummy, "linepun002")
;~ _ArrayAdd($dummy, "linepun003")
;~ _ArrayAdd($dummy, "linepun004")
;~ _ArrayAdd($dummy, "linepun005")
;~ _ArrayAdd($dummy, "linepun006")
;~ _ArrayAdd($dummy, "linepun007")
;~ _ArrayAdd($dummy, "linepun008")
;~ _ArrayAdd($dummy, "linepun009")
;~ _ArrayAdd($dummy, "linepun010")
;~ _ArrayAdd($dummy, "linepun011")
;~ _ArrayAdd($dummy, "linepun012")
;~ _ArrayAdd($dummy, "linepun013")
;~ _ArrayAdd($dummy, "linepun014")
;~ _ArrayAdd($dummy, "linepun015")
;~ _ArrayAdd($dummy, "linepun016")
;~ _ArrayAdd($dummy, "linepun017")
;~ _ArrayAdd($dummy, "linepun018")
;~ _ArrayAdd($dummy, "linepun019")
;~ _ArrayAdd($dummy, "linepun020")
;~ _ArrayAdd($dummy, "linepun021")
;~ _ArrayAdd($dummy, "linepun022")
;~ _ArrayAdd($dummy, "linepun023")
;~ _ArrayAdd($dummy, "linepun024")
;~ _ArrayAdd($dummy, "linepun025")
;~ _ArrayAdd($dummy, "linepun026")
;~ _ArrayAdd($dummy, "linepun027")
;~ _ArrayAdd($dummy, "linepun028")
;~ _ArrayAdd($dummy, "linepun029")
;~ _ArrayAdd($dummy, "linepun030")
;~ _ArrayAdd($dummy, "linepun031")
;~ _ArrayAdd($dummy, "linepun032")
;~ _ArrayAdd($dummy, "linepun033")
;~ _ArrayAdd($dummy, "linepun034")
;~ _ArrayAdd($dummy, "linepun035")
;~ _ArrayAdd($dummy, "linepun036")
;~ _ArrayAdd($dummy, "linepun037")
;~ _ArrayAdd($dummy, "linepun038")
;~ _ArrayAdd($dummy, "linepun039")
;~ _ArrayAdd($dummy, "linepun040")
;~ _ArrayAdd($dummy, "linepun041")
;~ _ArrayAdd($dummy, "linepun042")
;~ _ArrayAdd($dummy, "linepun043")
;~ _ArrayAdd($dummy, "linepun044")
;~ _ArrayAdd($dummy, "linepun045")
;~ _ArrayAdd($dummy, "linepun046")
;~ _ArrayAdd($dummy, "linepun047")
;~ _ArrayAdd($dummy, "linepun048")
;~ _ArrayAdd($dummy, "linepun049")
;~ _ArrayAdd($dummy, "linepun050")

;~ _ArrayAdd($dummy, "fish00001")
;~ _ArrayAdd($dummy, "fish00002")
;~ _ArrayAdd($dummy, "fish00003")
;~ _ArrayAdd($dummy, "fish00004")
;~ _ArrayAdd($dummy, "fish00005")
;~ _ArrayAdd($dummy, "fish00006")
;~ _ArrayAdd($dummy, "fish00007")
;~ _ArrayAdd($dummy, "fish00008")
;~ _ArrayAdd($dummy, "fish00009")
;~ _ArrayAdd($dummy, "fish00010")
;~ _ArrayAdd($dummy, "fish00011")
;~ _ArrayAdd($dummy, "fish00012")
;~ _ArrayAdd($dummy, "fish00013")
;~ _ArrayAdd($dummy, "fish00014")
;~ _ArrayAdd($dummy, "fish00015")
;~ _ArrayAdd($dummy, "fish00016")
;~ _ArrayAdd($dummy, "fish00017")
;~ _ArrayAdd($dummy, "fish00018")
;~ _ArrayAdd($dummy, "fish00019")
;~ _ArrayAdd($dummy, "fish00020")
;~ _ArrayAdd($dummy, "fish00021")
;~ _ArrayAdd($dummy, "fish00022")
;~ _ArrayAdd($dummy, "fish00023")
;~ _ArrayAdd($dummy, "fish00024")
;~ _ArrayAdd($dummy, "fish00025")
;~ _ArrayAdd($dummy, "fish00026")
;~ _ArrayAdd($dummy, "fish00027")
;~ _ArrayAdd($dummy, "fish00028")
;~ _ArrayAdd($dummy, "fish00029")
;~ _ArrayAdd($dummy, "fish00030")
;~ _ArrayAdd($dummy, "fish00031")
;~ _ArrayAdd($dummy, "fish00032")
;~ _ArrayAdd($dummy, "fish00033")
;~ _ArrayAdd($dummy, "fish00034")
;~ _ArrayAdd($dummy, "fish00036")
;~ _ArrayAdd($dummy, "fish00037")
;~ _ArrayAdd($dummy, "fish00038")
;~ _ArrayAdd($dummy, "fish00039")
;~ _ArrayAdd($dummy, "fish00040")
;~ _ArrayAdd($dummy, "fish00041")
;~ _ArrayAdd($dummy, "fish00042")
;~ _ArrayAdd($dummy, "fish00043")
;~ _ArrayAdd($dummy, "fish00044")
;~ _ArrayAdd($dummy, "fish00045")
;~ _ArrayAdd($dummy, "fish00046")
;~ _ArrayAdd($dummy, "fish00047")
;~ _ArrayAdd($dummy, "fish00048")
;~ _ArrayAdd($dummy, "fish00049")
;~ _ArrayAdd($dummy, "fish00050")
;~ _ArrayAdd($dummy, "fish00051")
;~ _ArrayAdd($dummy, "linefish001")
;~ _ArrayAdd($dummy, "linefish002")
;~ _ArrayAdd($dummy, "linefish003")
;~ _ArrayAdd($dummy, "linefish004")
;~ _ArrayAdd($dummy, "linefish005")
;~ _ArrayAdd($dummy, "linefish006")
;~ _ArrayAdd($dummy, "linefish007")
;~ _ArrayAdd($dummy, "linefish008")
;~ _ArrayAdd($dummy, "linefish009")
;~ _ArrayAdd($dummy, "linefish010")
;~ _ArrayAdd($dummy, "linefish011")
;~ _ArrayAdd($dummy, "linefish012")
;~ _ArrayAdd($dummy, "linefish013")
;~ _ArrayAdd($dummy, "linefish014")
;~ _ArrayAdd($dummy, "linefish015")
;~ _ArrayAdd($dummy, "linefish016")
;~ _ArrayAdd($dummy, "linefish017")
;~ _ArrayAdd($dummy, "linefish018")
;~ _ArrayAdd($dummy, "linefish019")
;~ _ArrayAdd($dummy, "linefish020")
;~ _ArrayAdd($dummy, "linefish021")
;~ _ArrayAdd($dummy, "linefish022")
;~ _ArrayAdd($dummy, "linefish023")
;~ _ArrayAdd($dummy, "linefish024")
;~ _ArrayAdd($dummy, "linefish025")
;~ _ArrayAdd($dummy, "linefish026")
;~ _ArrayAdd($dummy, "linefish027")
;~ _ArrayAdd($dummy, "linefish028")
;~ _ArrayAdd($dummy, "linefish029")
;~ _ArrayAdd($dummy, "linefish030")
;~ _ArrayAdd($dummy, "linefish031")
;~ _ArrayAdd($dummy, "linefish032")
;~ _ArrayAdd($dummy, "linefish033")
;~ _ArrayAdd($dummy, "linefish034")
;~ _ArrayAdd($dummy, "linefish035")
;~ _ArrayAdd($dummy, "linefish036")
;~ _ArrayAdd($dummy, "linefish038")
;~ _ArrayAdd($dummy, "linefish039")
;~ _ArrayAdd($dummy, "linefish040")
;~ _ArrayAdd($dummy, "linefish041")
;~ _ArrayAdd($dummy, "linefish042")
;~ _ArrayAdd($dummy, "linefish043")
;~ _ArrayAdd($dummy, "linefish044")
;~ _ArrayAdd($dummy, "linefish045")
;~ _ArrayAdd($dummy, "linefish046")
;~ _ArrayAdd($dummy, "linefish047")
;~ _ArrayAdd($dummy, "linefish048")
;~ _ArrayAdd($dummy, "linefish049")
;~ _ArrayAdd($dummy, "linefish050")
;~ _ArrayAdd($dummy, "lmft001")
;~ _ArrayAdd($dummy, "lmft002")
;~ _ArrayAdd($dummy, "lmft003")
;~ _ArrayAdd($dummy, "lmft004")
;~ _ArrayAdd($dummy, "lmft005")
;~ _ArrayAdd($dummy, "lmft006")
;~ _ArrayAdd($dummy, "lmft007")
;~ _ArrayAdd($dummy, "lmft008")
;~ _ArrayAdd($dummy, "lmft009")
;~ _ArrayAdd($dummy, "lmft010")
;~ _ArrayAdd($dummy, "lmft011")
;~ _ArrayAdd($dummy, "lmft012")
;~ _ArrayAdd($dummy, "lmft013")
;~ _ArrayAdd($dummy, "lmft014")
;~ _ArrayAdd($dummy, "lmft015")
;~ _ArrayAdd($dummy, "lmft016")
;~ _ArrayAdd($dummy, "lmft017")
;~ _ArrayAdd($dummy, "lmft018")
;~ _ArrayAdd($dummy, "lmft019")
;~ _ArrayAdd($dummy, "lmft020")
;~ _ArrayAdd($dummy, "lmft021")
;~ _ArrayAdd($dummy, "lmft022")
;~ _ArrayAdd($dummy, "lmft023")
;~ _ArrayAdd($dummy, "lmft024")
;~ _ArrayAdd($dummy, "lmft025")
;~ _ArrayAdd($dummy, "lmft026")
;~ _ArrayAdd($dummy, "lmft027")
;~ _ArrayAdd($dummy, "lmft028")
;~ _ArrayAdd($dummy, "lmft029")
;~ _ArrayAdd($dummy, "lmft030")
;~ _ArrayAdd($dummy, "lmft031")
;~ _ArrayAdd($dummy, "lmft032")
;~ _ArrayAdd($dummy, "lmft033")
;~ _ArrayAdd($dummy, "lmft034")
;~ _ArrayAdd($dummy, "lmft035")
;~ _ArrayAdd($dummy, "lmft036")
;~ _ArrayAdd($dummy, "lmft037")
;~ _ArrayAdd($dummy, "lmft038")
;~ _ArrayAdd($dummy, "lmft039")
;~ _ArrayAdd($dummy, "lmft040")
;~ _ArrayAdd($dummy, "lmft041")
;~ _ArrayAdd($dummy, "lmft042")
;~ _ArrayAdd($dummy, "lmft043")
;~ _ArrayAdd($dummy, "lmft044")
;~ _ArrayAdd($dummy, "lmft045")
;~ _ArrayAdd($dummy, "lmft046")
;~ _ArrayAdd($dummy, "lmft047")
;~ _ArrayAdd($dummy, "lmft048")
;~ _ArrayAdd($dummy, "lmft049")
;~ _ArrayAdd($dummy, "lmft050")
;~ _ArrayAdd($dummy, "stl551")
;~ _ArrayAdd($dummy, "stl552")
;~ _ArrayAdd($dummy, "stl553")
;~ _ArrayAdd($dummy, "stl554")
;~ _ArrayAdd($dummy, "stl555")
;~ _ArrayAdd($dummy, "stl556")
;~ _ArrayAdd($dummy, "stl557")
;~ _ArrayAdd($dummy, "stl558")
;~ _ArrayAdd($dummy, "stl559")
;~ _ArrayAdd($dummy, "stl560")
;~ _ArrayAdd($dummy, "stl561")
;~ _ArrayAdd($dummy, "stl562")
;~ _ArrayAdd($dummy, "stl563")
;~ _ArrayAdd($dummy, "stl564")
;~ _ArrayAdd($dummy, "stl565")
;~ _ArrayAdd($dummy, "stl566")
;~ _ArrayAdd($dummy, "stl567")
;~ _ArrayAdd($dummy, "stl568")
;~ _ArrayAdd($dummy, "stl569")
;~ _ArrayAdd($dummy, "stl570")
;~ _ArrayAdd($dummy, "stl571")
;~ _ArrayAdd($dummy, "stl572")
;~ _ArrayAdd($dummy, "stl573")
;~ _ArrayAdd($dummy, "stl574")
;~ _ArrayAdd($dummy, "stl575")
;~ _ArrayAdd($dummy, "stl576")
;~ _ArrayAdd($dummy, "stl577")
;~ _ArrayAdd($dummy, "stl578")
;~ _ArrayAdd($dummy, "stl579")
;~ _ArrayAdd($dummy, "stl580")
;~ _ArrayAdd($dummy, "stl581")
;~ _ArrayAdd($dummy, "stl582")
;~ _ArrayAdd($dummy, "stl583")
;~ _ArrayAdd($dummy, "stl584")
;~ _ArrayAdd($dummy, "stl585")
;~ _ArrayAdd($dummy, "stl586")
;~ _ArrayAdd($dummy, "stl587")
;~ _ArrayAdd($dummy, "appzang001")
;~ _ArrayAdd($dummy, "appzang002")
;~ _ArrayAdd($dummy, "appzang003")
;~ _ArrayAdd($dummy, "appzang004")
;~ _ArrayAdd($dummy, "appzang005")
;~ _ArrayAdd($dummy, "appzang006")
;~ _ArrayAdd($dummy, "bubblesticker1")
;~ _ArrayAdd($dummy, "bubblesticker2")
;~ _ArrayAdd($dummy, "bubblesticker3")
;~ _ArrayAdd($dummy, "fish000001")
;~ _ArrayAdd($dummy, "fish000002")
;~ _ArrayAdd($dummy, "fish000003")
;~ _ArrayAdd($dummy, "fish000004")
;~ _ArrayAdd($dummy, "fish000005")
;~ _ArrayAdd($dummy, "fish000006")
;~ _ArrayAdd($dummy, "fl001")
;~ _ArrayAdd($dummy, "fl002")
;~ _ArrayAdd($dummy, "fl003")
;~ _ArrayAdd($dummy, "fl004")
;~ _ArrayAdd($dummy, "fl005")
;~ _ArrayAdd($dummy, "fl006")
;~ _ArrayAdd($dummy, "fl008")
;~ _ArrayAdd($dummy, "fl009")
;~ _ArrayAdd($dummy, "fl010")
;~ _ArrayAdd($dummy, "fl011")
;~ _ArrayAdd($dummy, "fl012")
;~ _ArrayAdd($dummy, "fl013")
;~ _ArrayAdd($dummy, "fl014")
;~ _ArrayAdd($dummy, "fl015")
;~ _ArrayAdd($dummy, "jian001")
;~ _ArrayAdd($dummy, "jian002")
;~ _ArrayAdd($dummy, "jian003")
;~ _ArrayAdd($dummy, "jian004")
;~ _ArrayAdd($dummy, "jian005")
;~ _ArrayAdd($dummy, "jian006")
;~ _ArrayAdd($dummy, "mftoon01")
;~ _ArrayAdd($dummy, "mftoon02")
;~ _ArrayAdd($dummy, "mftoon03")
;~ _ArrayAdd($dummy, "mftoon04")
;~ _ArrayAdd($dummy, "mftoon05")

HotKeySet("!q", "Quit")

Func Quit()
   Exit(0)
EndFunc

WinMove($title, "", 0, 0)
WinActivate($title, "")

;tab add friend
MouseClick("left", 234, 76)

For $i = 1 to UBound($dummy) - 1 Step 1
   MouseClick("left", $searchEdit[0], $searchEdit[1])
   ConsoleWrite($dummy[$i] & @CRLF)
   Send("{HOME}{LSHIFT DOWN}{END}{LSHIFT UP}{DEL}")
   ClipPut($dummy[$i])
   Send("^v")
   Send("{ENTER}")
   Sleep(1400)
   MouseClick("left", $addBtn[0], $addBtn[1])
   Sleep(1000)
Next


ConsoleWrite("END" & @CRLF)