Option Explicit
Dim i As Integer
Dim x As Integer

Public Function load_pictures(ByVal i As Integer)
    txt_pic_b_1.Text = lst_pic_name.List(i)
    txt_Pic_ID_1.Text = lst_pic_id.List(i)
    
    If Left$(lst_pic_parth.List(i), 1) = "\" Then
        Pic_B_Photo_1.Picture = LoadPicture(database_Parth & lst_pic_parth.List(i))
    Else
        Pic_B_Photo_1.Picture = LoadPicture(lst_pic_parth.List(i))
    End If
    txt_pic_b_2.Text = lst_pic_name.List(i + 1)
    txt_Pic_ID_2.Text = lst_pic_id.List(i + 1)
    If Left$(lst_pic_parth.List(i + 1), 1) = "\" Then
        Pic_B_Photo_2.Picture = LoadPicture(database_Parth & lst_pic_parth.List(i + 1))
    Else
        Pic_B_Photo_2.Picture = LoadPicture(lst_pic_parth.List(i + 1))
    End If
    txt_pic_b_3.Text = lst_pic_name.List(i + 2)
    txt_Pic_ID_3.Text = lst_pic_id.List(i + 2)
    If Left$(lst_pic_parth.List(i + 2), 1) = "\" Then
        Pic_B_Photo_3.Picture = LoadPicture(database_Parth & lst_pic_parth.List(i + 2))
    Else
        Pic_B_Photo_3.Picture = LoadPicture(lst_pic_parth.List(i + 2))
    End If
    txt_pic_b_4.Text = lst_pic_name.List(i + 3)
    txt_Pic_ID_4.Text = lst_pic_id.List(i + 3)
    If Left$(lst_pic_parth.List(i + 3), 1) = "\" Then
        Pic_B_Photo_4.Picture = LoadPicture(database_Parth & lst_pic_parth.List(i + 3))
    Else
        Pic_B_Photo_4.Picture = LoadPicture(lst_pic_parth.List(i + 3))
    End If
    txt_pic_b_5.Text = lst_pic_name.List(i + 4)
    txt_Pic_ID_5.Text = lst_pic_id.List(i + 4)
    If Left$(lst_pic_parth.List(i + 4), 1) = "\" Then
        Pic_B_Photo_5.Picture = LoadPicture(database_Parth & lst_pic_parth.List(i + 4))
    Else
        Pic_B_Photo_5.Picture = LoadPicture(lst_pic_parth.List(i + 4))
    End If
    txt_pic_b_6.Text = lst_pic_name.List(i + 5)
    txt_Pic_ID_6.Text = lst_pic_id.List(i + 5)
    If Left$(lst_pic_parth.List(i + 5), 1) = "\" Then
        Pic_B_Photo_6.Picture = LoadPicture(database_Parth & lst_pic_parth.List(i + 5))
    Else
       Pic_B_Photo_6.Picture = LoadPicture(lst_pic_parth.List(i + 5))
    End If
End Function
Public Function load_Documents(ByVal i As Integer)
  txt_doc_ID_1.Text = lst_doc_id.List(i)
  txt_b_Doc_name_1.Text = lst_doc_name.List(i)
  If Left$(lst_doc_parth.List(i), 1) = "\" Then
    pic_b_Doc_1.Picture = LoadPicture(database_Parth & lst_doc_parth.List(i))
  Else
     pic_b_Doc_1.Picture = LoadPicture(lst_doc_parth.List(i))
  End If
  txt_doc_ID_2.Text = lst_doc_id.List(i + 1)
  txt_b_Doc_name_2.Text = lst_doc_name.List(i + 1)
  If Left$(lst_doc_parth.List(i + 1), 1) = "\" Then
     pic_b_Doc_2.Picture = LoadPicture(database_Parth & lst_doc_parth.List(i + 1))
  Else
    pic_b_Doc_2.Picture = LoadPicture(lst_doc_parth.List(i + 1))
  End If
  txt_doc_ID_3.Text = lst_doc_id.List(i + 2)
  txt_b_Doc_name_3.Text = lst_doc_name.List(i + 2)
  If Left$(lst_doc_parth.List(i + 2), 1) = "\" Then
    pic_b_Doc_3.Picture = LoadPicture(database_Parth & lst_doc_parth.List(i + 2))
  Else
      pic_b_Doc_3.Picture = LoadPicture(lst_doc_parth.List(i + 2))
  End If
  txt_doc_ID_4.Text = lst_doc_id.List(i + 3)
  txt_b_Doc_name_4.Text = lst_doc_name.List(i + 3)
  
  If Left$(lst_doc_parth.List(i + 3), 1) = "\" Then
      pic_b_Doc_4.Picture = LoadPicture(database_Parth & lst_doc_parth.List(i + 3))
  Else
    pic_b_Doc_4.Picture = LoadPicture(lst_doc_parth.List(i + 3))
  End If
  txt_doc_ID_5.Text = lst_doc_id.List(i + 4)
  txt_b_Doc_name_5.Text = lst_doc_name.List(i + 4)
  If Left$(lst_doc_parth.List(i + 4), 1) = "\" Then
     pic_b_Doc_5.Picture = LoadPicture(database_Parth & lst_doc_parth.List(i + 4))
  Else
     pic_b_Doc_5.Picture = LoadPicture(lst_doc_parth.List(i + 4))
  End If
  txt_doc_ID_6.Text = lst_doc_id.List(i + 5)
  txt_b_Doc_name_6.Text = lst_doc_name.List(i + 5)
  If Left$(lst_doc_parth.List(i + 5), 1) = "\" Then
      pic_b_Doc_6.Picture = LoadPicture(database_Parth & lst_doc_parth.List(i + 5))
  Else
      pic_b_Doc_6.Picture = LoadPicture(lst_doc_parth.List(i + 5))
  End If
End Function
Public Sub display_file(ByVal id_file As String)
Dim db As database
Dim rs_photo As Recordset
    file_id = txt_Pic_ID_1.Text
   Set db = OpenDatabase(database)
   Set rs_photo = db.OpenRecordset("select * From file where File_ID='" & id_file & "'")
   frm_display_document.txt_File_ID.Text = rs_photo![file_id]
   frm_display_document.txt_File_Name.Text = rs_photo![File_Name]
   frm_display_document.txt_File_Discription.Text = rs_photo![File_Discription]
   frm_display_document.txt_File_Parth.Text = rs_photo![File_Parth]
   frm_display_document.txt_File_Type_Externel.Text = rs_photo![File_Type_externel]
   If Left$(rs_photo![File_Parth], 1) = "\" Then
        frm_display_document.pic_display_file = LoadPicture(database_Parth & rs_photo![File_Parth])
   Else
        frm_display_document.pic_display_file = LoadPicture(rs_photo![File_Parth])
   End If
   frm_display_document.Show
   mdu_display_file.Photo
End Sub
Public Sub display_document(ByVal id_file As String)
Dim db As database
Dim rs_photo As Recordset
    file_id = txt_Pic_ID_1.Text
   Set db = OpenDatabase(database)
   Set rs_photo = db.OpenRecordset("select * From file where File_ID='" & id_file & "'")
   frm_display_document.txt_File_ID.Text = rs_photo![file_id]
   frm_display_document.txt_File_Name.Text = rs_photo![File_Name]
   frm_display_document.txt_File_Discription.Text = rs_photo![File_Discription]
   frm_display_document.txt_File_Parth.Text = rs_photo![File_Parth]
   frm_display_document.txt_File_Type_Externel.Text = rs_photo![File_Type_externel]
   
   If Left$(rs_photo![File_Parth], 1) = "\" Then
        frm_display_document.pic_display_file = LoadPicture(database_Parth & rs_photo![File_Parth])
   Else
        frm_display_document.pic_display_file = LoadPicture(rs_photo![File_Parth])
   End If
   frm_display_document.Show
   mdu_display_file.Document
End Sub
Public Sub load_profile()
Dim db As database
Dim rs_info_profile As Recordset
Dim rs_file As Recordset
Dim rs_doc As Recordset
Dim rs_profile_photo As Recordset
Set db = OpenDatabase(database)
Set rs_info_profile = db.OpenRecordset("Select * From People where ID_P_Number='" & frm_main.txt_center_id_num.Text & "'")
    txt_f_name.Text = rs_info_profile![F_Name]
    txt_MName.Text = rs_info_profile![M_Name]
    txt_SName.Text = rs_info_profile![S_Name]
    txt_nickname.Text = rs_info_profile![Nickname]
    txt_DOB.Text = rs_info_profile![Date_Of_Birth]
    txt_DOD.Text = rs_info_profile![Date_Of_Death]
    txt_l_sex_prefered_refrence.Text = rs_info_profile![Sex_Prefered_Reference]
    txt_sex_biological.Text = rs_info_profile![Sex_Biological]
    Set rs_file = db.OpenRecordset("Select * From File")
    While Not rs_file.EOF
        lst_pic_id.AddItem rs_file![file_id]
        lst_pic_name.AddItem rs_file![File_Name]
        lst_pic_parth.AddItem rs_file![File_Parth]
        rs_file.MoveNext
    Wend
    Set rs_doc = db.OpenRecordset("Select * From File")
    While Not rs_doc.EOF
        lst_doc_id.AddItem rs_doc![file_id]
        lst_doc_name.AddItem rs_doc![File_Name]
        lst_doc_parth.AddItem rs_doc![File_Parth]
        rs_doc.MoveNext
    Wend
    i = 0
    x = 0
Set rs_profile_photo = db.OpenRecordset("Select * from file where File_Discription='Profile Photo'")
If Left$(rs_profile_photo![File_Parth], 1) = "\" Then
    'database_Parth
    pic_profile_photo.Picture = LoadPicture(database_Parth & rs_profile_photo![File_Parth])
Else
    pic_profile_photo.Picture = LoadPicture(rs_profile_photo![File_Parth])
End If
    txt_profile_photo.Text = rs_profile_photo![file_id]
Call load_pictures(i)
Call load_Documents(x)
End Sub
Private Sub Add_Document_Click()
    Call cmd_add_Documents_Click
End Sub
Private Sub Add_photos_Click()
    Call cmd_add_photos_Click
End Sub
Private Sub btn_cancel_Click()
    frm_main.Cls
End Sub
Private Sub btn_save_Click()
Dim rs_show_check_profile As Recordset
Dim rs_check As Recordset
Dim db As database
Dim rs As Recordset
Dim rs_add_new_profile As Recordset
    Set db = OpenDatabase(database)

If add_new_profile = 0 Then
    Set rs_check = db.OpenRecordset("select * from People where People.F_Name='" & txt_f_name.Text & "' and People.M_Name='" & txt_MName.Text & "' and People.S_Name='" & txt_SName.Text & "' and People.Nickname='" & txt_nickname.Text & "' or People.Date_Of_Birth='" & txt_DOB.Text & "' and People.Date_Of_Death='" & txt_DOD.Text & "' and People.Sex_Biological='" & txt_sex_biological.Text & "' and People.Sex_Prefered_Reference='" & txt_l_sex_prefered_refrence.Text & "' and People.Born_Sex='" & txt_born_sex.Text & "'")
    If rs_check.RecordCount = 0 Then
        Set rs = db.OpenRecordset("Select * From People")
        rs.MoveLast
        rs.MoveNext
        Set dta_profile.Recordset = rs
             rs.AddNew
                rs![ID_P_Number] = rs.RecordCount + 1
                rs![F_Name] = txt_f_name.Text
                rs![M_Name] = txt_MName.Text
                rs![S_Name] = txt_SName.Text
                rs![Nickname] = txt_nickname.Text
                rs![Date_Of_Birth] = txt_DOB.Text
                rs![Date_Of_Death] = txt_DOD.Text
                rs![Born_Sex] = txt_born_sex.Text
                rs![Sex_Prefered_Reference] = txt_l_sex_prefered_refrence.Text
                rs![Sex_Biological] = txt_sex_biological.Text
             rs.Update
      Else
Dim msgbox_result As Integer
        MsgBox "The infomation may create duplicet infomation", vbCritical, "Error in Profiles infomation"
        msgbox_result = MsgBox("The infomation may create duplicet infomation", vbYesNo, "Would You like to see the relateing profiles")
        If msgbox_result = vbNo Then
'------------------------------------------------------------------------------------
                 Set rs = db.OpenRecordset("Select * From People")
                 rs.MoveLast
                 rs.MoveNext
                 Set dta_profile.Recordset = rs
                   rs.AddNew
                        rs![ID_P_Number] = rs.RecordCount + 1
                        rs![F_Name] = txt_f_name.Text
                        rs![M_Name] = txt_MName.Text
                        rs![S_Name] = txt_SName.Text
                        rs![Nickname] = txt_nickname.Text
                        rs![Date_Of_Birth] = txt_DOB.Text
                        rs![Date_Of_Death] = txt_DOD.Text
                        rs![Born_Sex] = txt_born_sex.Text
                        rs![Sex_Prefered_Reference] = txt_l_sex_prefered_refrence.Text
                        rs![Sex_Biological] = txt_sex_biological.Text
                   rs.Update
'-------------------------------------------------------------------------------------
        Else
            If msgbox_result = vbYes Then
                If rs_check.RecordCount = 1 Then
                    profile_check = rs_check![ID_P_Number]
                    frm_Profiles_Table.Show
                End If
            End If
        End If
    End If
End If
End Sub
Private Sub btn_table_Click()
    frm_Profiles_Table.Show
End Sub
Private Sub Cancel_Click()
    Call btn_cancel_Click
End Sub
Private Sub cmd_add_Documents_Click()
    add_new_file = 0
    type_of_added_photo = 1
    Call mdu_display_file.Document
    frm_display_document.txt_File_Parth.Text = CommonDialog1.FileName
    CommonDialog1.InitDir = "C:\"
    CommonDialog1.ShowOpen
    frm_display_document.Show
End Sub
Private Sub cmd_add_photos_Click()
    add_new_file = 0
        type_of_added_photo = 1
    Call mdu_display_file.Photo
    CommonDialog1.InitDir = "C:\"
    frm_display_document.txt_File_Parth.Text = CommonDialog1.FileName
    CommonDialog1.ShowOpen
    frm_display_document.Show
End Sub
Private Sub cmd_last_set_of_photos_Click()
    i = i - 6
    Call load_pictures(i)
End Sub
Private Sub cmd_next_set_of_photos_Click()
    i = i + 6
    Call load_pictures(i)
End Sub
Private Sub cmd_link_to_Picasa_Click()
    Shell ("C:\Program Files\Google\Picasa3\Picasa3.exe")
End Sub
Private Sub cmd_scan_Documents_Click()
    Shell ("C:\Windows\System32\WFS.exe")
CommonDialog1.InitDir = "C:\"
CommonDialog1.ShowOpen
    add_new_file = 0
    type_of_added_photo = 1
    Call mdu_display_file.Document
    frm_display_document.Show
End Sub
Private Sub cmd_scan_Photos_Click()
    Shell ("C:\Windows\System32\WFS.exe")
CommonDialog1.InitDir = "C:\"
CommonDialog1.ShowOpen
    add_new_file = 0
        type_of_added_photo = 1
    Call mdu_display_file.Photo
    frm_display_document.Show
End Sub
Private Sub Export_Click()
CommonDialog1.ShowSave
    mdu_save_as_bitamp.SaveFormImageToFile frm_profile, Picture1, CommonDialog1.InitDir & CommonDialog1.FileName
End Sub
Private Sub Form_Load()
Dim db As database
Dim rs As Recordset
If add_new_profile = 1 Then
    Call load_profile
Else
    Set db = OpenDatabase(database)
    Set rs = db.OpenRecordset("Select * from People")
    rs.MoveLast
    rs.MoveNext
    Set dta_profile.Recordset = rs
    add_new_profile = 0
End If
End Sub
Private Sub cmd_next_set_of_Documents_Click()
    x = x + 6
    Call load_Documents(x)
End Sub
Private Sub cmd_last_set_of_documents_Click()
    x = x - 6
    load_Documents (x)
End Sub

Private Sub Last_Document_Click()
    Call cmd_last_set_of_documents_Click
End Sub
Private Sub Last_Photo_Click()
    Call cmd_last_set_of_photos_Click
End Sub
Private Sub Next_document_Click()
    Call cmd_next_set_of_Documents_Click
End Sub
Private Sub Next_Photo_Click()
    Call cmd_next_set_of_photos_Click
End Sub
Private Sub pic_b_Doc_1_DblClick()
Dim file_id As String
    add_new_file = 1
    file_id = txt_doc_ID_1.Text
    display_document (file_id)
End Sub
Private Sub pic_b_Doc_1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    txt_profile_link.Text = "Dobble Click To View Full Document Details"
End Sub
Private Sub pic_b_Doc_2_DblClick()
Dim file_id As String
    add_new_file = 1
    file_id = txt_doc_ID_2.Text
    display_document (file_id)
End Sub
Private Sub pic_b_Doc_2_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    txt_profile_link.Text = "Dobble Click To View Full Document Details"
End Sub
Private Sub pic_b_Doc_3_DblClick()
Dim file_id As String
    add_new_file = 1
    file_id = txt_doc_ID_3.Text
    display_document (file_id)
End Sub
Private Sub pic_b_Doc_3_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    txt_profile_link.Text = "Dobble Click To View Full Document Details"
End Sub
Private Sub pic_b_Doc_4_DblClick()
Dim file_id As String
    add_new_file = 1
    file_id = txt_doc_ID_1.Text
    display_document (file_id)
End Sub
Private Sub pic_b_Doc_4_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    txt_profile_link.Text = "Dobble Click To View Full Document Details"
End Sub
Private Sub pic_b_Doc_5_DblClick()
Dim file_id As String
    add_new_file = 1
    file_id = txt_doc_ID_1.Text
    display_document (file_id)
End Sub
Private Sub pic_b_Doc_5_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    txt_profile_link.Text = "Dobble Click To View Full Document Details"
End Sub
Private Sub pic_b_Doc_6_DblClick()
Dim file_id As String
    add_new_file = 1
    file_id = txt_doc_ID_1.Text
    display_document (file_id)
End Sub
Private Sub pic_b_Doc_6_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
     txt_profile_link.Text = "Dobble Click To View Full Document Details"
End Sub
Private Sub Pic_B_Photo_1_DblClick()
Dim file_id As String
    add_new_file = 1
    file_id = txt_Pic_ID_1.Text
    display_file (file_id)
End Sub
Private Sub Pic_B_Photo_1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
     txt_profile_link.Text = "Dobble Click To View Full Photo Details"
End Sub
Private Sub Pic_B_Photo_2_DblClick()
Dim file_id As String
   add_new_file = 1
   file_id = txt_Pic_ID_2.Text
   display_file (file_id)
End Sub
Private Sub Pic_B_Photo_2_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
     txt_profile_link.Text = "Dobble Click To View Full Photo Details"
End Sub
Private Sub Pic_B_Photo_3_DblClick()
Dim file_id As String
  add_new_file = 1
   file_id = txt_Pic_ID_3.Text
   display_file (file_id)
End Sub
Private Sub Pic_B_Photo_3_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
     txt_profile_link.Text = "Dobble Click To View Full Photo Details"
End Sub
Private Sub Pic_B_Photo_4_DblClick()
Dim file_id As String
   add_new_file = 1
   file_id = txt_Pic_ID_4.Text
   display_file (file_id)
End Sub
Private Sub Pic_B_Photo_4_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
     txt_profile_link.Text = "Dobble Click To View Full Photo Details"
End Sub
Private Sub Pic_B_Photo_5_DblClick()
Dim file_id As String
   add_new_file = 1
   file_id = txt_Pic_ID_5.Text
   display_file (file_id)
End Sub
Private Sub Pic_B_Photo_5_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    txt_profile_link.Text = "Dobble Click To View Full Photo Details"
End Sub
Private Sub Pic_B_Photo_6_DblClick()
Dim file_id As String
   add_new_file = 1
   file_id = txt_Pic_ID_6.Text
   display_file (file_id)
End Sub
Private Sub pic_profile_photo_DblClick()
Dim file_id As String
   add_new_file = 1
   file_id = txt_profile_photo.Text
   display_file (file_id)
End Sub
Private Sub pic_profile_photo_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    txt_profile_link.Text = "Dobble Click To View Full Photo Details"
End Sub

Private Sub Picasa_Click()
    Call cmd_link_to_Picasa_Click
End Sub

Private Sub Print_Click()
    frm_profile.PrintForm
End Sub
Private Sub Save_Click()
    Call btn_save_Click
End Sub
Private Sub Scan_Document_Click()
    Call cmd_scan_Documents_Click
End Sub
Private Sub Scan_Photos_Click()
    Call cmd_scan_Photos_Click
End Sub
Private Sub SSTab_infomation_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    txt_profile_link.Text = ""
End Sub
Private Sub Table_Click()
    Call btn_table_Click
End Sub
Private Sub txt_b_Doc_name_1_Change()
    If txt_b_Doc_name_1.Text = "" Then
        txt_b_Doc_name_1.Visible = False
    Else
        txt_b_Doc_name_1.Visible = True
    End If
End Sub
Private Sub txt_b_Doc_name_2_Change()
    If txt_b_Doc_name_2.Text = "" Then
        txt_b_Doc_name_2.Visible = False
    Else
        txt_b_Doc_name_2.Visible = True
    End If
End Sub
Private Sub txt_b_Doc_name_3_Change()
    If txt_b_Doc_name_3.Text = "" Then
        txt_b_Doc_name_3.Visible = False
    Else
        txt_b_Doc_name_3.Visible = True
    End If
End Sub
Private Sub txt_b_Doc_name_4_Change()
    If txt_b_Doc_name_4.Text = "" Then
        txt_b_Doc_name_4.Visible = False
    Else
        txt_b_Doc_name_4.Visible = True
    End If
End Sub
Private Sub txt_b_Doc_name_5_Change()
    If txt_b_Doc_name_5.Text = "" Then
        txt_b_Doc_name_5.Visible = False
    Else
        txt_b_Doc_name_5.Visible = True
    End If
End Sub
Private Sub txt_b_Doc_name_6_Change()
    If txt_b_Doc_name_6.Text = "" Then
        txt_b_Doc_name_6.Visible = False
    Else
        txt_b_Doc_name_6.Visible = True
    End If
End Sub
Private Sub txt_DOB_LostFocus()
    mdu_reg_expretions.validate_date (txt_DOB.Text)
End Sub
Private Sub txt_DOD_LostFocus()
    mdu_reg_expretions.validate_date (txt_DOD.Text)
End Sub
Private Sub txt_f_name_LostFocus()
    mdu_reg_expretions.validate_name (txt_f_name)
End Sub
Private Sub txt_MName_LostFocus()
    mdu_reg_expretions.validate_name (txt_MName.Text)
End Sub
Private Sub txt_nickname_LostFocus()
If Len(txt_nickname) > 20 Or Len(txt_nickname) < 1 Then
    MsgBox "The nickname must be shorther that 20 charectors and longer than 0 charectors", vbCritical, "Error in lenth"
End If
End Sub
Private Sub txt_pic_b_1_Change()
    If txt_pic_b_1.Text = "" Then
        txt_pic_b_1.Visible = False
    Else
        txt_pic_b_1.Visible = True
    End If
End Sub
Private Sub txt_pic_b_2_Change()
    If txt_pic_b_2.Text = "" Then
        txt_pic_b_2.Visible = False
    Else
       txt_pic_b_2.Visible = True
    End If
End Sub
Private Sub txt_pic_b_3_Change()
    If txt_pic_b_3.Text = "" Then
        txt_pic_b_3.Visible = False
    Else
        txt_pic_b_3.Visible = True
    End If
End Sub
Private Sub txt_pic_b_4_Change()
    If txt_pic_b_4.Text = "" Then
        txt_pic_b_4.Visible = False
    Else
        txt_pic_b_4.Visible = True
    End If
End Sub
Private Sub txt_pic_b_5_Change()
    If txt_pic_b_5.Text = "" Then
        txt_pic_b_5.Visible = False
    Else
        txt_pic_b_5.Visible = True
    End If
End Sub
Private Sub txt_pic_b_6_Change()
    If txt_pic_b_6.Text = "" Then
        txt_pic_b_6.Visible = False
    Else
        txt_pic_b_6.Visible = True
    End If
End Sub
Private Sub txt_SName_LostFocus()
    mdu_reg_expretions.validate_name (txt_SName.Text)
End Sub
