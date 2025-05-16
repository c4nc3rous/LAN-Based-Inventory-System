Imports MySql.Data.MySqlClient

Module Connection
    Public connectionString As String = "Server=192.168.1.1;Port=3306;Database=imsdb;Uid=remoteuser;Pwd=userpassword;"
    Public conn As New MySqlConnection(connectionString)

    Public Function GetConnection() As MySqlConnection
        Return New MySqlConnection(connectionString)
    End Function
    Public Sub LoadData(dataGridView As Guna.UI2.WinForms.Guna2DataGridView)
        Dim query As String = "SELECT product_id, product_name, type, quantity FROM products"
        Dim dt As New DataTable()

        Using connection As New MySqlConnection(connectionString)
            Using command As New MySqlCommand(query, connection)
                Try
                    connection.Open()
                    Dim adapter As New MySqlDataAdapter(command)
                    adapter.Fill(dt)
                    dataGridView.DataSource = dt

                    dataGridView.Columns(0).HeaderText = "PRODUCT ID"
                    dataGridView.Columns(1).HeaderText = "NAME"
                    dataGridView.Columns(2).HeaderText = "TYPE"
                    dataGridView.Columns(3).HeaderText = "QUANTITY"

                Catch ex As MySqlException
                    MessageBox.Show("Error: " & ex.Message)
                End Try
            End Using
        End Using
    End Sub

    Public Sub LoadFormIntoPanel(panel As Panel, form As Form)
        If panel Is Nothing Then
            Throw New ArgumentNullException(NameOf(panel), "Panel cannot be null.")
        End If

        If form Is Nothing Then
            Throw New ArgumentNullException(NameOf(form), "Form cannot be null.")
        End If

        ' ✅ Remove existing form before adding a new one
        For Each ctrl As Control In panel.Controls
            If TypeOf ctrl Is Form Then
                Dim existingForm As Form = CType(ctrl, Form)
                existingForm.Close() ' Close the existing form properly
                panel.Controls.Remove(existingForm)
                Exit For ' Exit after removing the first form (assuming only one form is present)
            End If
        Next

        ' ✅ Load the new form inside the panel
        form.TopLevel = False
        form.FormBorderStyle = FormBorderStyle.None
        form.Dock = DockStyle.Fill
        panel.Controls.Add(form)

        form.Show()
        panel.Refresh() ' ✅ Force refresh to update the display
    End Sub
    Public Sub InsertActivityLog(userId As String, userName As String, activityDesc As String)
        Try
            If conn.State = ConnectionState.Closed Then
                conn.Open()
            End If

            Dim cmd As New MySqlCommand("INSERT INTO activity_log (user_id, user_name, activity) VALUES (@user_id, @user_name, @activity)", conn)
            cmd.Parameters.AddWithValue("@user_id", userId)
            cmd.Parameters.AddWithValue("@user_name", userName)
            cmd.Parameters.AddWithValue("@activity", activityDesc)

            cmd.ExecuteNonQuery()
        Catch ex As Exception
            MessageBox.Show("Failed to insert activity log: " & ex.Message)
        Finally
            conn.Close()
        End Try
    End Sub
End Module
