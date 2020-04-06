Option Explicit
Private Sub btn_delete_photos_Click()
    frm_display_document.Cls
End Sub
Private Sub btn_save_Click()
Dim rs_file As Recordset
Dim db As database
Dim rs As Recordset
Set db = OpenDatabase(database)
Dim types As String
     If type_of_file = 1 Then types = "photo"
     If type_of_file = 2 Then types = "Document"
Set rs_file = db.OpenRecordset("Select * From File where File_ID='" & txt_File_ID.Text & "' and File_Discription='" & txt_File_Discription.Text & "' and File_Name='" & txt_File_Name.Text & "' and File_Parth='" & txt_File_Parth.Text & "' and Type_of_file_internel='" & types & "' and File_Type_externel='" & txt_File_Type_Externel.Text & "'")
If rs_file.RecordCount = 1 Then
    MsgBox "The file has allredy beed added", vbCritical, "File Duplicet Error"
    
Else
    If add_new_file <> 1 Then
            Set db = OpenDatabase(database)
            Set rs = db.OpenRecordset("Select * From File")
            rs.MoveLast
            rs.AddNew
                rs![file_id] = Val(rs.RecordCount + 1)
                txt_File_ID.Text = rs![file_id]
                rs![File_Discription] = txt_File_Discription.Text
                rs![File_Name] = txt_File_Name.Text
                rs![File_Parth] = txt_File_Parth
              If type_of_file = 1 Then rs![Type_of_file_internel] = "photo"
              If type_of_file = 2 Then rs![Type_of_file_internel] = "Document"
              rs![File_Type_externel] = txt_File_Type_Externel
              rs.Update
  If type_of_added_photo = 1 Then
      Set rs = db.OpenRecordset("Select * From People_file")
          rs.AddNew
             rs![file_id] = txt_File_ID.Text
             rs![ID_P_Number] = frm_main.txt_center_id_num.Text
          rs.Update
     Else
   End If
  If type_of_added_photo = 2 Then '-conection
      Set rs = db.OpenRecordset("Select * From Conections_file")
          rs.AddNew
          rs![file_id] = txt_File_ID.Text
          rs![Conections_ID] = Frm_Relationships.txt_Conections_ID_one.Text
          rs.Update
          rs.MoveNext
          rs.AddNew
          rs![file_id] = txt_File_ID.Text
          rs![Conections_ID] = Frm_Relationships.txt_Conections_ID_two.Text
       rs.Update
      Else
   End If
  Else
      Set db = OpenDatabase(database)
      Set rs = db.OpenRecordset("Select * From File where File_ID='" & file_id & "'")
         rs.Edit
         rs![file_id] = Val(rs.RecordCount + 1)
         rs![File_Discription] = txt_File_Discription.Text
         rs![File_Name] = txt_File_Name.Text
         rs![File_Parth] = txt_File_Parth
         If type_of_file = 1 Then rs![Type_of_file_internel] = "photo"
         If type_of_file = 2 Then rs![Type_of_file_internel] = "Document"
         rs![File_Type_externel] = txt_File_Type_Externel
      rs.Update
  End If
  
End If
End Sub
Private Sub Delete_Click()
    frm_display_document.Cls
End Sub
Private Sub Export_Click()
CommonDialog1.ShowSave
    mdu_save_as_bitamp.SaveFormImageToFile frm_profile, Picture1, CommonDialog1.InitDir & CommonDialog1.FileName
End Sub

Private Sub Open_Click()
    Call txt_File_Parth_Click
End Sub
Private Sub pic_display_file_Click()
    CommonDialog1.ShowOpen
End Sub
Private Sub Form_Load()
Dim db As database
Dim rs As Recordset
If add_new_file = 1 Then
    Else
    Set db = OpenDatabase(database)
    Set rs = db.OpenRecordset("Select * From File")
    rs.MoveLast
    rs.MoveNext
    Set dta_diplay_file.Recordset = rs
End If
End Sub
Private Sub pic_display_file_DblClick()
    frm_display_document.Show
End Sub
Private Sub Print_Click()
    frm_display_document.PrintForm
End Sub
Private Sub Save_Click()
    Call btn_save_Click
End Sub
Private Sub txt_File_Discription_LostFocus()
    If Len(txt_File_Discription) > 500 Then
        MsgBox "The File Discription must be shourther that 500 charectors", vbCritical, "Lenth Error"
    End If
End Sub
Private Sub txt_File_Parth_Change()
    pic_display_file.Picture = LoadPicture(txt_File_Parth.Text)
End Sub
Private Sub txt_File_Parth_Click()
    CommonDialog1.ShowOpen
InputBox "By asering yes the database file will be able to be moved by ansering nothe fileparth will be fixed", "Do You wnat this file to be mobile"
  If vbYes Then
    txt_File_Parth.Text = CommonDialog1.FileName
    FileCopy txt_File_Parth.Text, database_Parth
      Else
        If vbNo Then
           CommonDialog1.ShowOpen
           txt_File_Parth.Text = CommonDialog1.FileName
         End If
  End If
End Sub
