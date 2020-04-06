Option Explicit

Private Sub cmd_show_all_profiles_Click()
Dim db As database
Dim rs As Recordset
Set db = OpenDatabase(database)
    Set rs = db.OpenRecordset("Select * From People")
    Set dta_table.Recordset = rs
End Sub
Private Sub cmd_show_curent_profile_Click()
Dim db As database
Dim rs As Recordset
Set db = OpenDatabase(database)
    Set rs = db.OpenRecordset("Select * From People where id_P_Number='" & frm_main.txt_center_id_num.Text & "'")
    Set dta_table.Recordset = rs
End Sub
Private Sub Form_Load()
    Dim db As database
    Dim rs As Recordset
    Set db = OpenDatabase(database)
    If profile_check = "" Then
        Set rs = db.OpenRecordset("Select * From People where id_P_Number='" & frm_main.txt_center_id_num.Text & "'")
    Else
        Set rs = db.OpenRecordset("Select * From People where id_P_Number='" & profile_check & "'")
        cmd_show_curent_profile.Visible = False
        cmd_show_all_profiles.Visible = False
    End If
    Set dta_table.Recordset = rs
End Sub
Private Sub Show_All_Profiles_Click()
    Call cmd_show_all_profiles_Click
End Sub
Private Sub Show_Current_Profile_Click()
    Call cmd_show_curent_profile_Click
End Sub
