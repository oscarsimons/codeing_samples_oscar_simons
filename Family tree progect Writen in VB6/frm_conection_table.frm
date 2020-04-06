Option Explicit
Private Sub btn_show_all_conections_Click()
Dim db As database
Dim rs As Recordset
    Set db = OpenDatabase(database)
    Set rs = db.OpenRecordset("Select * From Conections")
    Set dta_conection.Recordset = rs
End Sub
Private Sub btn_show_current_conection_Click()
Dim db As database
Dim rs As Recordset
Dim rs_2 As Recordset
    Set db = OpenDatabase(database)
    Set rs = db.OpenRecordset("Select Link_ID From Conections where Conections_ID='" & Frm_Relationships.txt_File_ID.Text & "'")
    Set rs_2 = db.OpenRecordset("Select * From Conections where Link_ID='" & rs![Link_ID] & "'")
    Set dta_conection.Recordset = rs_2
End Sub
Private Sub Form_Load()
Dim db As database
Dim rs As Recordset
Dim rs_2 As Recordset
    Set db = OpenDatabase(database)
    Set rs = db.OpenRecordset("Select Link_ID From Conections where Conections_ID='" & Frm_Relationships.txt_File_ID.Text & "'")
    Set rs_2 = db.OpenRecordset("Select * From Conections where Link_ID='" & rs![Link_ID] & "'")
    Set dta_conection.Recordset = rs_2
End Sub
Private Sub Show_All_Conections_Click()
    Call btn_show_all_conections_Click
End Sub
Private Sub Show_Current_Conection_Click()
    Call btn_show_current_conection_Click
End Sub
