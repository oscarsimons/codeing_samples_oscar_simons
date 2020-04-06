Option Explicit
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Dim hover_val As Integer
Dim parent_num As Integer
Dim sibling_num As Integer
Dim child_num As Integer
Public Sub load_parents(ByVal i As Integer)
    pic_profile_1.Picture = LoadPicture(lst_parents_File_parth.List(i))
    txt_profile_1.Text = lst_parents_name.List(i)
    pic_profile_2.Picture = LoadPicture(lst_parents_File_parth.List(i + 1))
    txt_profile_2.Text = lst_parents_name.List(i + 1)
    pic_profile_3.Picture = LoadPicture(lst_parents_File_parth.List(i + 2))
    txt_profile_3.Text = lst_parents_name.List(i + 2)
    pic_profile_4.Picture = LoadPicture(lst_parents_File_parth.List(i + 3))
    txt_profile_4.Text = lst_parents_name.List(i + 3)
    pic_profile_5.Picture = LoadPicture(lst_parents_File_parth.List(i + 4))
    txt_profile_5.Text = lst_parents_name.List(i + 4)
    pic_profile_6.Picture = LoadPicture(lst_parents_File_parth.List(i + 5))
    txt_profile_6.Text = lst_parents_name.List(i + 5)
End Sub
Public Sub load_siblings(ByVal i As Integer)
    pic_profile_7.Picture = LoadPicture(lst_siblings_File_parth.List(i))
    txt_profile_7.Text = lst_siblings_name.List(i)
    pic_profile_8.Picture = LoadPicture(lst_siblings_File_parth.List(i + 1))
    txt_profile_8.Text = lst_siblings_name.List(i + 1)
    pic_profile_9.Picture = LoadPicture(lst_siblings_File_parth.List(i + 2))
    txt_profile_9.Text = lst_siblings_name.List(i + 2)
    pic_profile_10.Picture = LoadPicture(lst_siblings_File_parth.List(i + 3))
    txt_profile_10.Text = lst_siblings_name.List(i + 3)
End Sub
Public Sub load_chinldren(ByVal i As Integer)
    pic_profile_11.Picture = LoadPicture(lst_child_File_parth.List(i))
    txt_profile_11.Text = lst_child_name.List(i)
    pic_profile_12.Picture = LoadPicture(lst_child_File_parth.List(i + 1))
    txt_profile_12.Text = lst_child_name.List(i + 1)
    pic_profile_13.Picture = LoadPicture(lst_child_File_parth.List(i + 2))
    txt_profile_13.Text = lst_child_name.List(i + 2)
    pic_profile_14.Picture = LoadPicture(lst_child_File_parth.List(i + 3))
    txt_profile_14.Text = lst_child_name.List(i + 3)
    pic_profile_15.Picture = LoadPicture(lst_child_File_parth.List(i + 4))
    txt_profile_15.Text = lst_child_name.List(i + 4)
    pic_profile_16.Picture = LoadPicture(lst_child_File_parth.List(i + 5))
    txt_profile_16.Text = lst_child_name.List(i + 5)
End Sub
Public Sub hover_event()
    If hover_val <> 1 Then
        txt_link_text.Text = "Click Here To See The Relationship"
     Else
         If hover_val = 1 Then txt_link_text.Text = "Click Here To See The Relationship"
    End If
End Sub
Private Sub Add_new_image_Click()
    Call mdu_display_file.Photo
    add_new_conection = 1
    frm_display_document.Show
End Sub

Private Sub Advanced_serch_Click()
    Call cmd_search_Click
End Sub

Private Sub Center_Profile_Click()
    Call frm_Profile_main_DblClick
End Sub
Private Sub cmd_center_Click()
loaded = 1
Frm_loading_profiles.Show
frm_serch.Visible = False
Dim db As database
Dim rs As Recordset
Dim rs_parent_pair_ID As Recordset
Dim rs_parent_id_number As Recordset
Dim rs_profile_photo As Recordset
Dim rs_parent_photo As Recordset
Dim i As Integer
Dim rs_name As Recordset
Dim name As String
Set db = OpenDatabase(database)
Set rs = db.OpenRecordset("select * from People where ID_P_Number='" & txt_center_id_num.Text & "'")
Set dta_center.Recordset = rs       'this will display the center profile names
    txt_fname = rs![F_Name]
    txt_MName = rs![M_Name]
    txt_SName = rs![S_Name]
Set rs_profile_photo = db.OpenRecordset("Select * from file where File_Discription='Profile Photo'")

   If Left$(rs_profile_photo![File_Parth], 1) = "\" Then
        pic_profile_main.Picture = LoadPicture(database_Parth & rs_profile_photo![File_Parth])
    Else
        pic_profile_main.Picture = LoadPicture(rs_profile_photo![File_Parth])
    End If


'###################### parent #######################
Set rs_parent_pair_ID = db.OpenRecordset("Select * From Conections where ID_P_Number='" & txt_center_id_num.Text & "'")
While Not rs_parent_pair_ID.EOF
    lst_parents_ID_P_Number.AddItem rs_parent_pair_ID![Link_ID]
    lst_parent_link_ID.AddItem rs_parent_pair_ID![Link_ID]
    rs_parent_pair_ID.MoveNext
Wend
rs_parent_pair_ID.MoveFirst

While Not rs_parent_pair_ID.EOF
    Set rs_parent_id_number = db.OpenRecordset("Select * From Conections where Link_ID='" & lst_parents_ID_P_Number.List(i) & "'")
    lst_parents_ID_P_Number.List(i) = rs_parent_id_number![ID_P_Number]
    i = i + 1
    rs_parent_pair_ID.MoveNext
Wend
rs_parent_pair_ID.MoveFirst
i = 0
While Not rs_parent_pair_ID.EOF
    Set rs_name = db.OpenRecordset("Select * From People where ID_P_Number='" & lst_parents_ID_P_Number.List(i) & "'")
    If lst_parents_ID_P_Number.List(i) = txt_center_id_num.Text Then
    Else
        name = rs_name![S_Name] + ", " + rs_name![F_Name] + " " + rs_name![M_Name]
        lst_parents_name.AddItem name
    End If
    i = i + 1
    rs_parent_pair_ID.MoveNext
Wend
i = 1
rs_parent_pair_ID.MoveFirst
While Not rs_parent_pair_ID.EOF
    Set rs_parent_photo = db.OpenRecordset("Select File_Parth From file People_File where People_File.File_ID='" & lst_parents_ID_P_Number.List(i) & "'")
    While Not rs_parent_photo.EOF
    If Left$(rs_parent_photo![File_Parth], 1) = "\" Then
        lst_parents_File_parth.AddItem database_Parth & rs_parent_photo![File_Parth]
    Else
        lst_parents_File_parth.AddItem rs_parent_photo![File_Parth]
    End If
       i = i + 1
       rs_parent_photo.MoveNext
    Wend
    rs_parent_pair_ID.MoveNext
Wend
'####################### end of parent########################
'########################  siblings ##########################
Dim rs_siblings_pair_ID As Recordset
Dim rs_siblings_id_number As Recordset
Dim rs_sibling_photo As Recordset

Set rs_siblings_pair_ID = db.OpenRecordset("Select * From Conections where ID_P_Number='" & txt_center_id_num.Text & "'")
While Not rs_siblings_pair_ID.EOF
    lst_siblings_id_p_number.AddItem rs_siblings_pair_ID![Link_ID]
    lst_sibling_link_ID.AddItem rs_siblings_pair_ID![Link_ID]
    rs_siblings_pair_ID.MoveNext
Wend
i = 0
While Not rs_siblings_pair_ID.EOF
    Set rs_siblings_id_number = db.OpenRecordset("Select * From Conections where Link_ID='" & lst_siblings_id_p_number.List(i) & "'")
    lst_sibling_link_ID.AddItem rs_siblings_id_number![ID_P_Number]
    rs_siblings_pair_ID.MoveNext
Wend
rs_siblings_pair_ID.MoveFirst
While Not rs_siblings_pair_ID.EOF
    '##########
    Set rs_name = db.OpenRecordset("Select * From People where ID_P_Number='" & lst_siblings_id_p_number.List(i) & "'")
    If lst_siblings_id_p_number.List(i) = txt_center_id_num.Text Then
    Else
        name = rs_name![S_Name] + ", " + rs_name![F_Name] + " " + rs_name![M_Name]
        lst_siblings_name.AddItem name
    End If
    i = i + 1
    '######
    rs_siblings_pair_ID.MoveNext
Wend
i = 0
rs_siblings_pair_ID.MoveFirst
While Not rs_siblings_pair_ID.EOF
    Set rs_sibling_photo = db.OpenRecordset("Select File_Parth From file People_File where People_File.File_ID='" & lst_siblings_id_p_number.List(i) & "'")
    While Not rs_sibling_photo.EOF
    If Left$(rs_sibling_photo![File_Parth], 1) = "\" Then
        lst_siblings_File_parth.AddItem database_Parth & rs_sibling_photo![File_Parth]
    Else
        lst_siblings_File_parth.AddItem rs_sibling_photo![File_Parth]
    End If
        rs_sibling_photo.MoveNext
    Wend
    i = i + 1
    rs_siblings_pair_ID.MoveNext
Wend
'####################### end of siblings ##########################
'########################## children ##############################
Dim rs_child_pair_ID As Recordset
Dim rs_child_id_number As Recordset
Dim rs_child_photo As Recordset

Set rs_child_pair_ID = db.OpenRecordset("Select * From Conections where ID_P_Number='" & txt_center_id_num.Text & "'")
While Not rs_child_pair_ID.EOF
    lst_child_id_p_number.AddItem rs_child_pair_ID![Link_ID]
    lst_child_link_ID.AddItem rs_child_pair_ID![Link_ID]
    rs_child_pair_ID.MoveNext
Wend
i = 0
While Not rs_child_pair_ID.EOF
    Set rs_child_id_number = db.OpenRecordset("Select * From Conections where Link_ID='" & lst_child_id_p_number.List(i) & "'")
    lst_child_id_p_number.List(i) = rs_siblings_id_number![ID_P_Number]
    i = i + 1
    rs_child_pair_ID.MoveNext
Wend
rs_child_pair_ID.MoveFirst

i = 0
While Not rs_child_pair_ID.EOF
    Set rs_name = db.OpenRecordset("Select * From People where ID_P_Number='" & lst_child_id_p_number.List(i) & "'")
    If lst_child_id_p_number.List(i) = txt_center_id_num.Text Then
    Else
        name = rs_name![S_Name] + ", " + rs_name![F_Name] + " " + rs_name![M_Name]
        lst_child_name.AddItem name
    End If
    i = i + 1
    rs_child_pair_ID.MoveNext
Wend
' reads in the profile photo of the people
i = 0
rs_child_pair_ID.MoveFirst
While Not rs_child_pair_ID.EOF
    Set rs_child_photo = db.OpenRecordset("Select File_Parth From file People_File where People_File.File_ID='" & lst_child_id_p_number.List(i) & "'")
    While Not rs_child_photo.EOF
    If Left$(rs_child_photo![File_Parth], 1) = "\" Then
        lst_child_File_parth.AddItem database_Parth & rs_child_photo![File_Parth]
    Else
        lst_child_File_parth.AddItem rs_child_photo![File_Parth]
    End If
        rs_child_photo.MoveNext
    Wend
    i = i + 1
    rs_child_pair_ID.MoveNext
Wend
'######################### end of children #######################
'need to add in the conection levels to the quereys and to make sure that it works
parent_num = 0
 sibling_num = 0
child_num = 0
Call load_parents(parent_num)
Call load_siblings(sibling_num)
Call load_chinldren(child_num)
loaded = 0
    Frm_loading_profiles.txt_loading.Text = "end"
End Sub
Private Sub cmd_next_Parent_Click()
    parent_num = parent_num + 6
    Call load_parents(parent_num)
End Sub
Private Sub cmd_last_Parent_Click()
    parent_num = parent_num - 6
    Call load_parents(parent_num)
End Sub
Private Sub cmd_last_sibling_Click()
    sibling_num = sibling_num - 6
    Call load_siblings(sibling_num)
End Sub
Private Sub cmd_Next_sibling_Click()
    sibling_num = sibling_num + 6
    Call load_siblings(sibling_num)
End Sub
Private Sub cmd_last_child_Click()
    child_num = child_num - 6
    Call load_chinldren(child_num)
End Sub
Private Sub cmd_next_child_Click()
    child_num = child_num + 6
    Call load_chinldren(child_num)
End Sub
Private Sub cmd_last_rs_Click()
    dta_main.Recordset.MovePrevious
End Sub
Private Sub cmd_next_rs_Click()
    dta_main.Recordset.MoveNext
End Sub
Private Sub cmd_search_Click()
    frm_serch_form.Show
End Sub
Private Sub Export_Click()
CommonDialog1.ShowSave

    cmd_last_Parent.Visible = False
    lbl_serch.Visible = False
    txt_serch.Visible = False
    cmd_center.Visible = False
    cmd_search.Visible = False
    cmd_next_Parent.Visible = False
    cmd_Next_sibling.Visible = False
    cmd_next_child.Visible = False
    cmd_last_child.Visible = False
    cmd_last_sibling.Visible = False
    cmd_last_Parent.Visible = False
    File.Visible = False
    Add.Visible = False
    Help.Visible = False
    txt_link_text.Visible = False
 mdu_save_as_bitamp.SaveFormImageToFile frm_main, Picture1, CommonDialog1.InitDir & CommonDialog1.FileName
    cmd_last_Parent.Visible = True
    lbl_serch.Visible = True
    txt_serch.Visible = True
    cmd_center.Visible = True
    cmd_search.Visible = True
    cmd_next_Parent.Visible = True
    cmd_Next_sibling.Visible = True
    cmd_next_child.Visible = True
    cmd_last_child.Visible = True
    cmd_last_sibling.Visible = True
    cmd_last_Parent.Visible = True
    File.Visible = True
    Add.Visible = True
    Help.Visible = True


End Sub
Private Sub First_Child_relationships_Click()
    Call frm_line11_Click
End Sub
Private Sub Fith_Child_relationships_Click()
    Call frm_line15_Click
End Sub
Private Sub fith_parent_relationships_Click()
    Call fre_line5_Click
End Sub
Private Sub Form_Load()
    frm_serch.Visible = False
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
   txt_link_text.Text = ""
End Sub
Private Sub Forth_Child_relationships_Click()
    Call frm_line14_Click
End Sub
Private Sub forth_parent_relationships_Click()
    Call fre_line4_Click
End Sub
Private Sub Forth_sibling_relationships_Click()
    Call frm_line10_Click
End Sub
Private Sub fre_line_1_Click()
    add_new_conection = 1
    relationship_id = lst_parent_link_ID.List(parent_num)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_1.Text
    Frm_Relationships.Show
End Sub
Private Sub fre_line_1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub fre_line2_Click()
    add_new_conection = 1
    relationship_id = lst_parent_link_ID.List(parent_num + 1)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_2.Text
    Frm_Relationships.Show
End Sub
Private Sub fre_line2_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub fre_line3_Click()
    add_new_conection = 1
    relationship_id = lst_parent_link_ID.List(parent_num + 2)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_3.Text
    Frm_Relationships.Show
End Sub
Private Sub fre_line3_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub fre_line4_Click()
    add_new_conection = 1
    relationship_id = lst_parent_link_ID.List(parent_num + 3)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_4.Text
    Frm_Relationships.Show
End Sub
Private Sub fre_line4_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub fre_line5_Click()
    add_new_conection = 1
    relationship_id = lst_parent_link_ID.List(parent_num + 4)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_5.Text
    Frm_Relationships.Show
End Sub
Private Sub fre_line5_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub fre_line6_Click()
    add_new_conection = 1
    relationship_id = lst_parent_link_ID.List(parent_num + 5)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_6.Text
    Frm_Relationships.Show
End Sub
Private Sub fre_line6_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub frm_line10_Click()
    add_new_conection = 1
    relationship_id = lst_sibling_link_ID.List(sibling_num)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_10.Text
    Frm_Relationships.Show
End Sub
Private Sub frm_line10_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub frm_line11_Click()
    add_new_conection = 1
    relationship_id = lst_child_link_ID.List(child_num)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_11.Text
    Frm_Relationships.Show
End Sub
Private Sub frm_line11_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub frm_line12_Click()
    add_new_conection = 1
    relationship_id = lst_child_link_ID.List(child_num)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_12.Text
    Frm_Relationships.Show
End Sub
Private Sub frm_line12_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub frm_line13_Click()
    add_new_conection = 1
    relationship_id = lst_child_link_ID.List(child_num)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_13.Text
    Frm_Relationships.Show
End Sub
Private Sub frm_line13_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub frm_line14_Click()
    add_new_conection = 1
    relationship_id = lst_child_link_ID.List(child_num)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_14.Text
    Frm_Relationships.Show
End Sub
Private Sub frm_line14_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub frm_line15_Click()
    add_new_conection = 1
    relationship_id = lst_child_link_ID.List(child_num)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_15.Text
    Frm_Relationships.Show
End Sub
Private Sub frm_line15_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub frm_line16_Click()
    add_new_conection = 1
    relationship_id = lst_child_link_ID.List(child_num)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_16.Text
    Frm_Relationships.Show
End Sub
Private Sub frm_line16_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub frm_line7_Click()
    add_new_conection = 1
    relationship_id = lst_sibling_link_ID.List(sibling_num)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_7.Text
    Frm_Relationships.Show
End Sub
Private Sub frm_line7_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub frm_line8_Click()
    add_new_conection = 1
    relationship_id = lst_sibling_link_ID.List(sibling_num + 1)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_8.Text
    Frm_Relationships.Show
    Frm_Relationships.Show
End Sub
Private Sub frm_line8_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub frm_line9_Click()
    add_new_conection = 1
    relationship_id = lst_sibling_link_ID.List(sibling_num)
    Frm_Relationships.txt_person_one.Text = txt_SName.Text + ", " + txt_fname.Text + " " + txt_MName.Text
    Frm_Relationships.txt_person_two.Text = txt_profile_9.Text
    Frm_Relationships.Show
End Sub
Private Sub frm_line9_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    hover_event
End Sub
Private Sub frm_Profile_main_DblClick()
add_new_profile = 1
    frm_profile.Show
End Sub
Private Sub frm_Profile_main_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    txt_link_text.Text = "Dobble Click Here To Go To The Main Profile"
End Sub
Private Sub Last_Child_Click(Index As Integer)
    Call cmd_last_child_Click
End Sub
Private Sub Last_parents_Click(Index As Integer)
    Call cmd_last_Parent_Click
End Sub
Private Sub Last_siblings_Click(Index As Integer)
    Call cmd_last_sibling_Click
End Sub
Private Sub New_Click()
Dim test As String
Dim mesagebox As Integer
    CommonDialog1.ShowSave
    test = CommonDialog1.DialogTitle & CommonDialog1.FileName

   FileCopy App.Path & "\Add_new_database.mdb", test & ".mdb"
'makes a copy of the serch database in the parth selected in the filelistbox
mesagebox = MsgBox("File Has Been Saved", , "File Hase Been Saved")
 
'uses the blank file in the app parth
'    FileCopy App.Path & "\Serch database test.mdb", test & ".mdb"

End Sub
Private Sub New_Conection_Click()
add_new_conection = 0
    Frm_Relationships.Show
End Sub
Private Sub New_Profile_Click()
add_new_profile = 0
    frm_profile.Show
End Sub
Private Sub Next_Child_Click(Index As Integer)
    Call cmd_next_child_Click
End Sub
Private Sub Next_parents_Click(Index As Integer)
    Call cmd_next_Parent_Click
End Sub
Private Sub Next_Siblings_Click(Index As Integer)
    Call cmd_Next_sibling_Click
End Sub
Private Sub one_parent_relationships_Click()
    Call fre_line_1_Click
End Sub
Private Sub One_sibling_relationships_Click()
    Call frm_line7_Click
End Sub
Private Sub Open_Click()
Dim mesagebox As Integer
Dim i As Integer
Dim x As Integer
Dim j As Integer
Dim parth As String
Dim name As String
Dim string1 As String
Dim string2 As String
    CommonDialog1.ShowOpen
    string1 = CommonDialog1.FileName
    parth = string1
    i = Len(string1)
    string1 = CommonDialog1.FileTitle
    name = string1
    x = Len(string1)
    j = i - x
    string2 = Left$(parth, j - 1)
        database_Parth = string2
'makes a copy of the serch database in the parth selected in the filelistbox
mesagebox = MsgBox("File Has Been opened", , "File Hase Been opened")
database = CommonDialog1.FileName
End Sub
Private Sub Print_Click()
    cmd_last_Parent.Visible = False
    lbl_serch.Visible = False
    txt_serch.Visible = False
    cmd_center.Visible = False
    cmd_search.Visible = False
    cmd_next_Parent.Visible = False
    cmd_Next_sibling.Visible = False
    cmd_next_child.Visible = False
    cmd_last_child.Visible = False
    cmd_last_sibling.Visible = False
    cmd_last_Parent.Visible = False
    File.Visible = False
    Add.Visible = False
    Help.Visible = False
    txt_link_text.Visible = False
  frm_main.PrintForm
    cmd_last_Parent.Visible = True
    lbl_serch.Visible = True
    txt_serch.Visible = True
    cmd_center.Visible = True
    cmd_search.Visible = True
    cmd_next_Parent.Visible = True
    cmd_Next_sibling.Visible = True
    cmd_next_child.Visible = True
    cmd_last_child.Visible = True
    cmd_last_sibling.Visible = True
    cmd_last_Parent.Visible = True
    File.Visible = True
    Add.Visible = True
    Help.Visible = True
End Sub
Private Sub Save_As_Click()
Dim test As String
Dim mesagebox As Integer
    CommonDialog1.ShowSave
    test = CommonDialog1.DialogTitle & CommonDialog1.FileName
    FileCopy database, test & ".mdb"
'makes a copy of the serch database in the parth selected in the filelistbox
mesagebox = MsgBox("File Has Been Saved", , "File Hase Been Saved")
End Sub
Private Sub Serch_Click()
    txt_serch.SetFocus
End Sub
Private Sub Sixth_Child_relationships_Click()
    Call frm_line16_Click
End Sub
Private Sub sixth_parent_relationships_Click()
    Call fre_line6_Click
End Sub
Private Sub Third_sibling_relationships_Click()
    Call frm_line9_Click
End Sub
Private Sub three_Child_relationships_Click()
    Call frm_line13_Click
End Sub
Private Sub three_parent_relationships_Click()
    Call fre_line3_Click
End Sub
Private Sub two_Child_relationships_Click()
    Call frm_line12_Click
End Sub
Private Sub two_parent_relationships_Click()
    Call fre_line2_Click
End Sub
Private Sub Two_sibling_relationships_Click()
    Call frm_line8_Click
End Sub
Private Sub txt_serch_Change()
frm_serch.Visible = True
Dim db As database
Dim rs As Recordset
    Set db = OpenDatabase(database)
    Set rs = db.OpenRecordset("select * from People where People.F_Name like '*" & txt_serch.Text & "*'")
    Set dta_main.Recordset = rs
End Sub
Private Sub txt_serch_LostFocus()
    frm_serch.Visible = False
    cmd_center.SetFocus
End Sub
