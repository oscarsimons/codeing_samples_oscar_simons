Public Sub delet_serch()
Dim db_serch As database
Dim rs_people_serch As Recordset
Dim rs_file_serch As Recordset
Dim rs_conections_serch As Recordset
Set db_serch = OpenDatabase(App.Path & "\Serch database test.mdb")
Set rs_people_serch = db_serch.OpenRecordset("Select * From People")
While Not rs_people_serch.EOF
       rs_people_serch.Delete
    rs_people_serch.MoveNext
Wend
' the people recordset has beed deleted and updates it
Set rs_file_serch = db_serch.OpenRecordset("Select * From File")
While Not rs_file_serch.EOF
    rs_file_serch.Delete
    rs_file_serch.MoveNext
Wend
' the file recordset has beed deleted and updates it
Set rs_conections_serch = db_serch.OpenRecordset("Select * From Conections")
While Not rs_conections_serch.EOF
    rs_conections_serch.Delete
    rs_conections_serch.MoveNext
Wend
' the Conections recordset has beed deleted and updates it
End Sub
Private Sub Cmd_save_serch_Click()
Dim test As String
Dim mesagebox As Integer
    CommonDialog1.ShowSave
    test = CommonDialog1.DialogTitle & CommonDialog1.FileName
'uses the blank file in the app parth
    FileCopy App.Path & "\Serch database test.mdb", test & ".mdb"
'makes a copy of the serch database in the parth selected in the filelistbox
mesagebox = MsgBox("File Has Been Saved", , "File Hase Been Saved")
End Sub
Private Sub cmd_serch_Click()
'###################### serch list one from test #############################
lst_letters.Clear
lst_serch_criteria.Clear
lst_refine_search.Clear
Dim i As Integer
Dim test As String
Dim word As String
i = 0
For i = 0 To Len(txt_serch.Text)
    test = Right$(txt_serch.Text, Len(txt_serch.Text) - i)
    test = Left$(test, 1)
    lst_letters.AddItem test
Next i
i = 0
For i = 0 To Len(txt_serch.Text)
    If lst_letters.List(i) = "+" Or lst_letters.List(i) = "-" Then
        If lst_letters.List(i) <> "-" Then lst_serch_criteria.AddItem word
        If lst_letters.List(i) <> "+" Then lst_refine_search.AddItem word
        word_count = word_count + 1
        word = ""
    Else
        word = word + lst_letters.List(i)
    End If

Next i
    lst_serch_criteria.AddItem word


'###################### serch list one from test #############################
m = 0
Dim db_serch As database
Dim db As database
Dim rs_serch As Recordset
Dim rs_people As Recordset
Dim rs_people_serch As Recordset
Dim rs_conections As Recordset
Dim rs_file_serch As Recordset
Dim rs_file As Recordset
Dim test_string As String
Dim rs_conections_serch As Recordset


Set db = OpenDatabase(database)
Set db_serch = OpenDatabase(App.Path & "\Serch database test.mdb")
m = 0
For m = 0 To word_count
    test_string = lst_serch_criteria.List(m)
Set dta_people.Recordset = rs_people

   Set rs_people = db.OpenRecordset("select * from People where People.ID_P_Number like '*" & test_string & "*' or People.F_Name like '*" & test_string & "*' or People.M_Name like '*" & test_string & "*' or People.S_Name like '*" & test_string & "*' or People.Nickname like '*" & test_string & "*' or People.Date_Of_Birth like '*" & test_string & "*' or People.Date_Of_Death like '*" & test_string & "*' or People.Sex_Biological like '*" & test_string & "*' or People.Sex_Prefered_Reference like '*" & test_string & "*' or People.Born_Sex like '*" & test_string & "*'")
While Not rs_people.EOF
    Set dta_people.Recordset = rs_people_serch
    Set rs_people_serch = db_serch.OpenRecordset("Select * From People")
       rs_people_serch.AddNew
             rs_people_serch![ID_P_Number] = rs_people![ID_P_Number]
             rs_people_serch![F_Name] = rs_people![F_Name]
             rs_people_serch![M_Name] = rs_people![M_Name]
             rs_people_serch![S_Name] = rs_people![S_Name]
             rs_people_serch![Nickname] = rs_people![Nickname]
             rs_people_serch![Date_Of_Birth] = rs_people![Date_Of_Birth]
             rs_people_serch![Date_Of_Death] = rs_people![Date_Of_Death]
             rs_people_serch![Sex_Biological] = rs_people![Sex_Biological]
             rs_people_serch![Sex_Prefered_Reference] = rs_people![Sex_Prefered_Reference]
             rs_people_serch![Born_Sex] = rs_people![Born_Sex]
       rs_people_serch.Update
  rs_people.MoveNext
Wend

Set dta_file.Recordset = rs_file
   Set rs_file = db.OpenRecordset("Select * From File where File_ID like '*" & test_string & "*' or File_Discription like '*" & test_string & "*' or File_Name like '*" & test_string & "*' or File_Parth like '*" & test_string & "*' or Type_of_file_internel like '*" & test_string & "*' or File_Type_externel like '*" & test_string & "*'")
   Set rs_file_serch = db_serch.OpenRecordset("Select * From File")
   While Not rs_file.EOF
      rs_file_serch.AddNew
           rs_file_serch![file_id] = rs_file![file_id]
           rs_file_serch![File_Discription] = rs_file![File_Discription]
           rs_file_serch![File_Name] = rs_file![File_Name]
           rs_file_serch![File_Parth] = rs_file![File_Parth]
           rs_file_serch![Type_of_file_(internel)] = rs_file![Type_of_file_internel]
           rs_file_serch![File_Type_(externel)] = rs_file![File_Type_externel]
      rs_file_serch.Update
      rs_file.MoveNext
   Wend

Set dta_file.Recordset = rs_conections
Set rs_conections = db.OpenRecordset("Select * from Conections where Conections_ID like '*" & test_string & "*' or Link_ID like '*" & test_string & "*' or Definition like '*" & test_string & "*' or Date_Of_entry like '*" & test_string & "*' or Date_Of_change like '*" & test_string & "*' or ID_P_Number like '*" & test_string & "*' or Conection_Level like '*" & test_string & "*'")
Set rs_conections_serch = db_serch.OpenRecordset("Select * From Conections")
While Not rs_conections.EOF
     rs_conections_serch.AddNew
           rs_conections_serch![Conections_ID] = rs_conections![Conections_ID]
           rs_conections_serch![Link_ID] = rs_conections![Link_ID]
           rs_conections_serch![Definition] = rs_conections![Definition]
           rs_conections_serch![Date_Of_entry] = rs_conections![Date_Of_entry]
           rs_conections_serch![Date_Of_change] = rs_conections![Date_Of_change]
           rs_conections_serch![ID_P_Number] = rs_conections![ID_P_Number]
           rs_conections_serch![Conection_Level] = rs_conections![Conection_Level]
     rs_conections_serch.Update
     rs_conections.MoveNext
Wend
Next m

Set rs_people = db_serch.OpenRecordset("Select * From People")
Set dta_people.Recordset = rs_people

Set rs_conections = db_serch.OpenRecordset("Select * From Conections")
Set dta_conections.Recordset = rs_conections

Set rs_file = db_serch.OpenRecordset("Select * From File")
Set dta_file.Recordset = rs_file

End Sub
Private Sub Form_Load()
    Call delet_serch
End Sub
Private Sub Save_serch_Click()
    Call Cmd_save_serch_Click
End Sub
Private Sub Serch_Click()
    Call cmd_serch_Click
End Sub
Private Sub txt_serch_LostFocus()
    cmd_serch.SetFocus
End Sub
