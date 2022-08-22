﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:2.0.50727.3053
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict Off
Option Explicit On

<Assembly: Global.System.Data.Objects.DataClasses.EdmSchemaAttribute("0a13f70f-8125-426f-b506-09e0f8764104")> 

'Original file name:
'Generation date: 4/28/2009 5:40:47 PM
'''<summary>
'''There are no comments for MoviesDBEntities in the schema.
'''</summary>
Partial Public Class MoviesDBEntities
    Inherits Global.System.Data.Objects.ObjectContext
    '''<summary>
    '''Initializes a new MoviesDBEntities object using the connection string found in the 'MoviesDBEntities' section of the application configuration file.
    '''</summary>
    Public Sub New()
        MyBase.New("name=MoviesDBEntities", "MoviesDBEntities")
        Me.OnContextCreated
    End Sub
    '''<summary>
    '''Initialize a new MoviesDBEntities object.
    '''</summary>
    Public Sub New(ByVal connectionString As String)
        MyBase.New(connectionString, "MoviesDBEntities")
        Me.OnContextCreated
    End Sub
    '''<summary>
    '''Initialize a new MoviesDBEntities object.
    '''</summary>
    Public Sub New(ByVal connection As Global.System.Data.EntityClient.EntityConnection)
        MyBase.New(connection, "MoviesDBEntities")
        Me.OnContextCreated
    End Sub
    Partial Private Sub OnContextCreated()
        End Sub
    '''<summary>
    '''There are no comments for MovieCategorySet in the schema.
    '''</summary>
    Public ReadOnly Property MovieCategorySet() As Global.System.Data.Objects.ObjectQuery(Of MovieCategory)
        Get
            If (Me._MovieCategorySet Is Nothing) Then
                Me._MovieCategorySet = MyBase.CreateQuery(Of MovieCategory)("[MovieCategorySet]")
            End If
            Return Me._MovieCategorySet
        End Get
    End Property
    Private _MovieCategorySet As Global.System.Data.Objects.ObjectQuery(Of MovieCategory)
    '''<summary>
    '''There are no comments for MovieSet in the schema.
    '''</summary>
    Public ReadOnly Property MovieSet() As Global.System.Data.Objects.ObjectQuery(Of Movie)
        Get
            If (Me._MovieSet Is Nothing) Then
                Me._MovieSet = MyBase.CreateQuery(Of Movie)("[MovieSet]")
            End If
            Return Me._MovieSet
        End Get
    End Property
    Private _MovieSet As Global.System.Data.Objects.ObjectQuery(Of Movie)
    '''<summary>
    '''There are no comments for MovieCategorySet in the schema.
    '''</summary>
    Public Sub AddToMovieCategorySet(ByVal movieCategory As MovieCategory)
        MyBase.AddObject("MovieCategorySet", movieCategory)
    End Sub
    '''<summary>
    '''There are no comments for MovieSet in the schema.
    '''</summary>
    Public Sub AddToMovieSet(ByVal movie As Movie)
        MyBase.AddObject("MovieSet", movie)
    End Sub
End Class
'''<summary>
'''There are no comments for MoviesDBModel.MovieCategory in the schema.
'''</summary>
'''<KeyProperties>
'''Id
'''</KeyProperties>
<Global.System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName:="MoviesDBModel", Name:="MovieCategory"),  _
 Global.System.Runtime.Serialization.DataContractAttribute(IsReference:=true),  _
 Global.System.Serializable()>  _
Partial Public Class MovieCategory
    Inherits Global.System.Data.Objects.DataClasses.EntityObject
    '''<summary>
    '''Create a new MovieCategory object.
    '''</summary>
    '''<param name="id">Initial value of Id.</param>
    '''<param name="name">Initial value of Name.</param>
    '''<param name="position">Initial value of Position.</param>
    Public Shared Function CreateMovieCategory(ByVal id As Integer, ByVal name As String, ByVal position As Integer) As MovieCategory
        Dim movieCategory As MovieCategory = New MovieCategory
        movieCategory.Id = id
        movieCategory.Name = name
        movieCategory.Position = position
        Return movieCategory
    End Function
    '''<summary>
    '''There are no comments for Property Id in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty:=true, IsNullable:=false),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property Id() As Integer
        Get
            Return Me._Id
        End Get
        Set
            Me.OnIdChanging(value)
            Me.ReportPropertyChanging("Id")
            Me._Id = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value)
            Me.ReportPropertyChanged("Id")
            Me.OnIdChanged
        End Set
    End Property
    Private _Id As Integer
    Partial Private Sub OnIdChanging(ByVal value As Integer)
        End Sub
    Partial Private Sub OnIdChanged()
        End Sub
    '''<summary>
    '''There are no comments for Property Name in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable:=false),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property Name() As String
        Get
            Return Me._Name
        End Get
        Set
            Me.OnNameChanging(value)
            Me.ReportPropertyChanging("Name")
            Me._Name = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false)
            Me.ReportPropertyChanged("Name")
            Me.OnNameChanged
        End Set
    End Property
    Private _Name As String
    Partial Private Sub OnNameChanging(ByVal value As String)
        End Sub
    Partial Private Sub OnNameChanged()
        End Sub
    '''<summary>
    '''There are no comments for Property Position in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable:=false),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property Position() As Integer
        Get
            Return Me._Position
        End Get
        Set
            Me.OnPositionChanging(value)
            Me.ReportPropertyChanging("Position")
            Me._Position = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value)
            Me.ReportPropertyChanged("Position")
            Me.OnPositionChanged
        End Set
    End Property
    Private _Position As Integer
    Partial Private Sub OnPositionChanging(ByVal value As Integer)
        End Sub
    Partial Private Sub OnPositionChanged()
        End Sub
End Class
'''<summary>
'''There are no comments for MoviesDBModel.Movie in the schema.
'''</summary>
'''<KeyProperties>
'''Id
'''</KeyProperties>
<Global.System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName:="MoviesDBModel", Name:="Movie"),  _
 Global.System.Runtime.Serialization.DataContractAttribute(IsReference:=true),  _
 Global.System.Serializable()>  _
Partial Public Class Movie
    Inherits Global.System.Data.Objects.DataClasses.EntityObject
    '''<summary>
    '''Create a new Movie object.
    '''</summary>
    '''<param name="id">Initial value of Id.</param>
    '''<param name="title">Initial value of Title.</param>
    '''<param name="director">Initial value of Director.</param>
    '''<param name="dateReleased">Initial value of DateReleased.</param>
    Public Shared Function CreateMovie(ByVal id As Integer, ByVal title As String, ByVal director As String, ByVal dateReleased As Date) As Movie
        Dim movie As Movie = New Movie
        movie.Id = id
        movie.Title = title
        movie.Director = director
        movie.DateReleased = dateReleased
        Return movie
    End Function
    '''<summary>
    '''There are no comments for Property Id in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty:=true, IsNullable:=false),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property Id() As Integer
        Get
            Return Me._Id
        End Get
        Set
            Me.OnIdChanging(value)
            Me.ReportPropertyChanging("Id")
            Me._Id = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value)
            Me.ReportPropertyChanged("Id")
            Me.OnIdChanged
        End Set
    End Property
    Private _Id As Integer
    Partial Private Sub OnIdChanging(ByVal value As Integer)
        End Sub
    Partial Private Sub OnIdChanged()
        End Sub
    '''<summary>
    '''There are no comments for Property Title in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable:=false),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property Title() As String
        Get
            Return Me._Title
        End Get
        Set
            Me.OnTitleChanging(value)
            Me.ReportPropertyChanging("Title")
            Me._Title = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false)
            Me.ReportPropertyChanged("Title")
            Me.OnTitleChanged
        End Set
    End Property
    Private _Title As String
    Partial Private Sub OnTitleChanging(ByVal value As String)
        End Sub
    Partial Private Sub OnTitleChanged()
        End Sub
    '''<summary>
    '''There are no comments for Property Director in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable:=false),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property Director() As String
        Get
            Return Me._Director
        End Get
        Set
            Me.OnDirectorChanging(value)
            Me.ReportPropertyChanging("Director")
            Me._Director = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false)
            Me.ReportPropertyChanged("Director")
            Me.OnDirectorChanged
        End Set
    End Property
    Private _Director As String
    Partial Private Sub OnDirectorChanging(ByVal value As String)
        End Sub
    Partial Private Sub OnDirectorChanged()
        End Sub
    '''<summary>
    '''There are no comments for Property DateReleased in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable:=false),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property DateReleased() As Date
        Get
            Return Me._DateReleased
        End Get
        Set
            Me.OnDateReleasedChanging(value)
            Me.ReportPropertyChanging("DateReleased")
            Me._DateReleased = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value)
            Me.ReportPropertyChanged("DateReleased")
            Me.OnDateReleasedChanged
        End Set
    End Property
    Private _DateReleased As Date
    Partial Private Sub OnDateReleasedChanging(ByVal value As Date)
        End Sub
    Partial Private Sub OnDateReleasedChanged()
        End Sub
End Class
