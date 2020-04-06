Option Explicit
Dim j As Integer
Dim pair As String
Public Sub Conection_document()
        frm_display_document.Caption = "Display Document For Conection"
        frm_display_document.lbl_File_ID.Caption = "Unique File ID"
        frm_display_document.lbl_File_Name.Caption = "File Conection Name"
        frm_display_document.lbl_File_Discription.Caption = "Discription Of Conection"
        frm_display_document.lbl_File_Parth.Caption = "Parth To Document"
        frm_display_document.lbl_File_Type_Externel.Caption = "File Type"
End Sub
Public Sub load_conection()
'this procedure loads in the two varables and diaplays the result in the textboxes
' essentually it loads eveything in
Dim db As database
Dim rs_Link_id As Recordset
Dim rs_link_two As Recordset
Dim rs_name As Recordset
Dim rs_find_file As Recordset
Dim rs_find_ID As Recordset
Dim i As Integer
Dim name As String
Dim rs_definition As Recordset
Set db = OpenDatabase(database)

   txt_Conections_ID_one.Text = relationship_id
    
Set rs_Link_id = db.OpenRecordset("Select * from conections where Conections_ID='" & relationship_id & "'")

txt_date_of_entry.Text = rs_Link_id![Date_Of_entry]
txt_date_of_change.Text = rs_Link_id![Date_Of_change]
txt_relationship_def_one.Text = rs_Link_id![Definition]
txt_conection_level_one.Text = rs_Link_id![Conection_Level]

pair = rs_Link_id![Link_ID]
Set rs_definition = db.OpenRecordset("Select * from conections where Link_ID='" & pair & "' and Conections_ID<>'" & relationship_id & "'")

txt_Conections_ID_two.Text = rs_definition![Conections_ID]
txt_relationship_def_two.Text = rs_definition![Definition]
txt_conection_level_two.Text = rs_definition![Conection_Level]
' reeds in the text strings part of the screen
Set rs_find_ID = db.OpenRecordset("select file_ID from Conections_file where Conections_file.Conections_ID='" & relationship_id & "'")
While Not rs_find_ID.EOF
    lst_conection_photo_file_id.AddItem rs_find_ID![file_id]
    rs_find_ID.MoveNext
Wend
i = 0
rs_find_ID.MoveFirst
While Not rs_find_ID.EOF
    Set rs_find_file = db.OpenRecordset("Select * from File where file_id='" & lst_conection_photo_file_id.List(i) & "'")
    lst_conection_photo_file_id.List(i) = rs_find_file![file_id]
    lst_conection_photo_file_parth.List(i) = rs_find_file![File_Parth]
    i = i + 1
    rs_find_ID.MoveNext
Wend
'reads in the pictures
j = 0
pic_relationship_file.Picture = LoadPicture(lst_conection_photo_file_parth.List(j))
txt_File_ID.Text = lst_conection_photo_file_id.List(j)
End Sub

Private Sub Add_Photo_Click()
    Call btn_add_photos_Click
End Sub
Private Sub btn_add_photos_Click()
    add_new_file = 0
        type_of_added_photo = 1
    Call mdu_display_file.Photo
    CommonDialog1.InitDir = "C:\Users\Public\Pictures"
    frm_display_document.txt_File_Parth.Text = CommonDialog1.FileName
    CommonDialog1.ShowOpen
    frm_display_document.Show
End Sub
Private Sub btn_save_Conection_Click()
Dim db As database
Dim rs As Recordset
Set db = OpenDatabase(database)
Set rs = db.OpenRecordset("Select * From Conections where Link_ID='" & pair & "'")
Set dta_relationships.Recordset = rs
If add_new_conection = 1 Then
    rs.Edit
        rs![Definition] = txt_relationship_def_one.Text
        rs![Conection_Level] = txt_conection_level_one.Text
        rs![Date_Of_entry] = txt_date_of_entry.Text
        rs![Date_Of_change] = txt_date_of_change.Text
        rs![ID_P_Number] = txt_id_p_number_one.Text
    rs.Update
    rs.MoveNext
    rs.Edit
        rs![Definition] = txt_relationship_def_two.Text
        rs![Date_Of_entry] = txt_date_of_entry.Text
        rs![Date_Of_change] = txt_date_of_change.Text
        rs![ID_P_Number] = txt_id_p_number_two.Text
        rs![Conection_Level] = txt_conection_level_two.Text
    rs.Update
Else
    rs.AddNew
        rs![Conections_ID] = txt_Conections_ID_one.Text
        rs![Definition] = txt_relationship_def_one.Text
        rs![Conection_Level] = txt_conection_level_one.Text
        rs![Date_Of_entry] = txt_date_of_entry.Text
        rs![Date_Of_change] = txt_date_of_change.Text
        rs![ID_P_Number] = txt_id_p_number_one.Text
    rs.Update
    rs.MoveNext
    rs.AddNew
        rs![Conections_ID] = txt_Conections_ID_two.Text
        rs![Definition] = txt_relationship_def_two.Text
        rs![Date_Of_entry] = txt_date_of_entry.Text
        rs![Date_Of_change] = txt_date_of_change.Text
        rs![ID_P_Number] = txt_id_p_number_two.Text
        rs![Conection_Level] = txt_conection_level_two.Text
    rs.Update
End If
End Sub
Private Sub cmd_last_photo_Click()
    j = j - 1
    pic_relationship_file.Picture = LoadPicture(lst_conection_photo_file_parth.List(j))
    txt_File_ID.Text = lst_conection_photo_file_id.List(j)
End Sub
Private Sub cmd_next_photo_Click()
    j = j + 1
If Left$(lst_conection_photo_file_parth.List(j), 1) = "\" Then
    pic_relationship_file.Picture = LoadPicture(database_Parth & lst_conection_photo_file_parth.List(j))
Else
    pic_relationship_file.Picture = LoadPicture(lst_conection_photo_file_parth.List(j))
End If
    txt_File_ID.Text = lst_conection_photo_file_id.List(j)
End Sub
Private Sub cmd_person_one_last_profile_Click()
    dta_person_one.Recordset.MovePrevious
End Sub
Private Sub cmd_Person_one_next_profile_Click()
    dta_person_one.Recordset.MoveNext
End Sub
Private Sub cmd_person_one_use_person_Click()
Dim db As database
Dim rs As Recordset
    Set db = OpenDatabase(database)
    Set rs = db.OpenRecordset("Select * from People where ID_P_Number='" & txt_id_p_number_one.Text & "'")
    txt_person_one.Text = rs![S_Name] + ", " + rs![F_Name] + " " + rs![M_Name]
End Sub
Private Sub cmd_person_two_last_profile_Click()
    dta_person_two.Recordset.MoveNext
End Sub
Private Sub cmd_person_two_next_profile_Click()
    dta_person_two.Recordset.MoveNext
End Sub
Private Sub cmd_person_two_use_person_Click()
Dim db As database
Dim rs As Recordset
    Set db = OpenDatabase(database)
    Set rs = db.OpenRecordset("Select * from People where ID_P_Number='" & txt_id_p_number_two.Text & "'")
    txt_person_two.Text = rs![S_Name] + ", " + rs![F_Name] + " " + rs![M_Name]
    frm_person_one.Visible = False
End Sub

Private Sub cmd_scann_photos_Click()
    Shell ("C:\Windows\System32\WFS.exe")
CommonDialog1.InitDir = "C:\Users\Oscar Sansung\Documents\Scanned Documents"
CommonDialog1.ShowOpen
    add_new_file = 0
        type_of_added_photo = 1
    Call mdu_display_file.Photo
    frm_display_document.Show
End Sub
Private Sub cmd_view_in_table_view_Click()
    frm_conection_table.Show
End Sub

Private Sub Export_Click()
    CommonDialog1.ShowSave
    mdu_save_as_bitamp.SaveFormImageToFile Frm_Relationships, Picture1, CommonDialog1.InitDir & CommonDialog1.FileName
End Sub
Private Sub Form_Load()
Dim db As database
Dim rs As Recordset
If add_new_conection = 1 Then
        Call load_conection
    Else
    Set db = OpenDatabase(database)
    Set rs = db.OpenRecordset("Select * from conections")
    rs.MoveLast
    rs.MoveNext
    Set dta_relationships.Recordset = rs
    txt_Conections_ID_one.Text = Val(rs.RecordCount + 1)
    txt_Conections_ID_two.Text = Val(rs.RecordCount + 2)
End If
j = 0
    pic_relationship_file.Picture = LoadPicture(lst_conection_photo_file_parth.List(j))
    txt_File_ID.Text = lst_conection_photo_file_id.List(j)
frm_person_one.Visible = True
frm_person_two.Visible = True
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    frm_person_one.Visible = False
    frm_person_two.Visible = False
End Sub

Private Sub Last_Photo_Click()
    Call cmd_last_photo_Click
End Sub
Private Sub Next_Photo_Click()
    Call cmd_next_photo_Click
End Sub
Private Sub pic_relationship_file_DblClick()
    frm_display_document.Show
    Conection_document
Dim db As database
Dim rs_photo As Recordset
Dim id_file As String
    id_file = txt_File_ID.Text
   Set db = OpenDatabase(database)
   Set rs_photo = db.OpenRecordset("select * From file where File_ID='" & id_file & "'")
   frm_display_document.txt_File_ID.Text = rs_photo![file_id]
   frm_display_document.txt_File_Name.Text = rs_photo![File_Name]
   frm_display_document.txt_File_Discription.Text = rs_photo![File_Discription]
   frm_display_document.txt_File_Parth.Text = rs_photo![File_Parth]
   frm_display_document.txt_File_Type_Externel.Text = rs_photo![File_Type_(externel)]
     If Left$(rs_photo![File_Parth], 1) = "\" Then
        frm_display_document.pic_display_file = database_Parth & rs_parent_photo![File_Parth]
    Else
        frm_display_document.pic_display_file = rs_parent_photo![File_Parth]
    End If
   frm_display_document.Show
   mdu_display_file.Document
End Sub
Private Sub pic_relationship_file_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
   frm_person_one.Visible = False
   frm_person_two.Visible = False
End Sub

Private Sub Save_conection_Click()
    Call btn_save_Conection_Click
End Sub
Private Sub Scan_Photos_Click()
    Call cmd_scann_photos_Click
End Sub

Private Sub Table_Click()
    Call cmd_view_in_table_view_Click
End Sub
Private Sub txt_date_of_change_LostFocus()
    mdu_reg_expretions.validate_date (txt_date_of_change.Text)
End Sub
Private Sub txt_date_of_entry_LostFocus()
    mdu_reg_expretions.validate_date (txt_date_of_entry.Text)
End Sub
Private Sub txt_person_one_Change()
Dim db As database
Dim rs As Recordset
   Set db = OpenDatabase(database)
   Set rs = db.OpenRecordset("select * from People where People.F_Name like '*" & txt_person_one.Text & "*'")
   Set dta_person_one.Recordset = rs
   frm_person_one.Visible = True
   frm_person_two.Visible = False
End Sub
Private Sub txt_person_two_Change()
Dim db As database
Dim rs As Recordset
   Set db = OpenDatabase(database)
   Set rs = db.OpenRecordset("select * from People where People.F_Name like '*" & txt_person_two.Text & "*'")
   Set dta_person_two.Recordset = rs
      frm_person_one.Visible = False
      frm_person_two.Visible = True
End Sub

