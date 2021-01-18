<%@ page title="Customer Billing Management System" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA._Default" codebehind="Default.aspx.cs" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
     <fieldset>
        <legend>Appointments</legend>
        <telerik:RadScheduler runat="server" DataSourceID="sql" Height="" ID="radsch" DataKeyField="ID" Skin="Metro" DataSubjectField="Subject"
            DataStartField="Start" DataEndField="End" DataRecurrenceField="RecurrenceRule"
            DataRecurrenceParentKeyField="RecurrenceParentID">

        </telerik:RadScheduler>
        <asp:EntityDataSource runat="server" ID="EntityDataSource1" DefaultContainerName="SikatoEntities" ConnectionString="name=SikatoEntities" EnableFlattening="False" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntitySetName="Appointments"></asp:EntityDataSource>
    </fieldset>
    <asp:SqlDataSource ID="sql" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Appointments] WHERE [ID] = @original_ID AND [Subject] = @original_Subject AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Start] = @original_Start AND [End] = @original_End AND (([RecurrenceRule] = @original_RecurrenceRule) OR ([RecurrenceRule] IS NULL AND @original_RecurrenceRule IS NULL)) AND (([RecurrenceParentID] = @original_RecurrenceParentID) OR ([RecurrenceParentID] IS NULL AND @original_RecurrenceParentID IS NULL)) AND (([Reminder] = @original_Reminder) OR ([Reminder] IS NULL AND @original_Reminder IS NULL)) AND (([Annotations] = @original_Annotations) OR ([Annotations] IS NULL AND @original_Annotations IS NULL)) AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL))" InsertCommand="INSERT INTO [Appointments] ([Subject], [Description], [Start], [End], [RecurrenceRule], [RecurrenceParentID], [Reminder], [Annotations], [UserID]) VALUES (@Subject, @Description, @Start, @End, @RecurrenceRule, @RecurrenceParentID, @Reminder, @Annotations, @UserID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Appointments] WHERE ([UserID] = @UserID)" UpdateCommand="UPDATE [Appointments] SET [Subject] = @Subject, [Description] = @Description, [Start] = @Start, [End] = @End, [RecurrenceRule] = @RecurrenceRule, [RecurrenceParentID] = @RecurrenceParentID, [Reminder] = @Reminder, [Annotations] = @Annotations, [UserID] = @UserID WHERE [ID] = @original_ID AND [Subject] = @original_Subject AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Start] = @original_Start AND [End] = @original_End AND (([RecurrenceRule] = @original_RecurrenceRule) OR ([RecurrenceRule] IS NULL AND @original_RecurrenceRule IS NULL)) AND (([RecurrenceParentID] = @original_RecurrenceParentID) OR ([RecurrenceParentID] IS NULL AND @original_RecurrenceParentID IS NULL)) AND (([Reminder] = @original_Reminder) OR ([Reminder] IS NULL AND @original_Reminder IS NULL)) AND (([Annotations] = @original_Annotations) OR ([Annotations] IS NULL AND @original_Annotations IS NULL)) AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Subject" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Start" Type="DateTime" />
            <asp:Parameter Name="original_End" Type="DateTime" />
            <asp:Parameter Name="original_RecurrenceRule" Type="String" />
            <asp:Parameter Name="original_RecurrenceParentID" Type="Int32" />
            <asp:Parameter Name="original_Reminder" Type="String" />
            <asp:Parameter Name="original_Annotations" Type="String" />
            <asp:Parameter Name="original_UserID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Start" Type="DateTime" />
            <asp:Parameter Name="End" Type="DateTime" />
            <asp:Parameter Name="RecurrenceRule" Type="String" />
            <asp:Parameter Name="RecurrenceParentID" Type="Int32" />
            <asp:Parameter Name="Reminder" Type="String" />
            <asp:Parameter Name="Annotations" Type="String" />
            <asp:Parameter Name="UserID" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="user" Name="UserID" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Start" Type="DateTime" />
            <asp:Parameter Name="End" Type="DateTime" />
            <asp:Parameter Name="RecurrenceRule" Type="String" />
            <asp:Parameter Name="RecurrenceParentID" Type="Int32" />
            <asp:Parameter Name="Reminder" Type="String" />
            <asp:Parameter Name="Annotations" Type="String" />
            <asp:Parameter Name="UserID" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Subject" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Start" Type="DateTime" />
            <asp:Parameter Name="original_End" Type="DateTime" />
            <asp:Parameter Name="original_RecurrenceRule" Type="String" />
            <asp:Parameter Name="original_RecurrenceParentID" Type="Int32" />
            <asp:Parameter Name="original_Reminder" Type="String" />
            <asp:Parameter Name="original_Annotations" Type="String" />
            <asp:Parameter Name="original_UserID" Type="String" />
        </UpdateParameters>
       
     </asp:SqlDataSource>
    <asp:Label ID="user" ForeColor="White" runat="server"></asp:Label>
</asp:content>

