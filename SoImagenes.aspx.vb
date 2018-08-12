Imports System
Imports System.Data
Imports System.Drawing
Imports System.IO

Partial Class So_SoImagenes
    Inherits System.Web.UI.Page

    Dim DSService As ServiciosWEB.Servicios
    Dim Respuesta As DataSet
    Dim pProgramName As String = "SoImagenes"
    Dim pTable As String = "SoDocumentosXSolicitud"
    Dim pFields As String = "KeyDocumento,IdSolicitud,Pversion,Lado,Ruta,Correcta,DescDocumento,Fecha"
    Dim pAllFields As String = "KeyDocumento,IdSolicitud,Pversion,Lado,Ruta,Correcta,DescDocumento,Fecha"
    Dim pCondition As String = ""
    Dim pOrderKey As String = "IdAttach"
    Dim pOrderDesc As String = "IdAttach"
    Dim ConnStr, ConnStrB, EstatusSol As String
    Dim tCanAdd, tCanEdit, tCanDelete As Boolean
    Dim tQuery, numidexpcred As String
    '-- RQ497 HN
    Dim arrOperacionesZacatecas As String() = {"474649", "474918", "475138", "474704", "474412", "473048", "474698", "475865", "475348"}

    Dim arrOperacionesBCS As String() = {"420472", "420243", "420235", "420124", "420279", "420052", "419534", "419452", _
                                    "420023", "420139", "417246", "417412", "416755", "416037", "416504", "417023", _
                                    "417879", "416704", "416498", "417161", "417225", "417095", "416986", "416658", _
                                    "417335", "417046", "417002", "416489", "417334", "418227", "417463", "417755", _
                                    "416627", "417236", "417886", "417450", "419336", "418671", "418916", "418398", _
                                    "418914", "419176", "419396", "418923", "419183", "416377", "416452", "416458", _
                                    "416513", "416443", "416666", "416697", "416739", "416758", "416780", "416817", _
                                    "416836", "416838", "416853", "416865", "416916", "416849", "416935", "417039", _
                                    "417219", "417081", "417267", "417277", "417278", "417351", "417366", "417381", _
                                    "417388", "417401", "417417", "417431", "417448", "417488", "417499", "417510", _
                                    "417539", "417547", "417574", "417416", "417451", "417490", "417514", "417586", _
                                    "417675", "417777", "417884", "417894", "417743", "417939", "418166", "418346", _
                                    "418368", "418449", "418458", "417701", "417669", "419339", "419373", "419392", _
                                    "419409", "419431", "419438", "419203", "419567", "419637", "419785", "419819", _
                                    "419831", "419925", "419987", "419992", "420009", "420056", "420076", "420082", _
                                    "420097", "420107", "420116", "420127", "419968", "419978", "420190", "420206", _
                                    "420224", "420278", "420292", "420302", "420303", "421113", "421157", "421179", _
                                    "420274", "420259", "420104", _
                                    "403455", _
"410785", _
"406283", _
"407157", _
"397817", _
"394711", _
"414829", _
"398843", _
"392586", _
"397470", _
"402249", _
"405918", _
"402399", _
"398666", _
"400321", _
"403057", _
"396895", _
"410641", _
"413263", _
"401487", _
"393422", _
"407164", _
"410143", _
"403307", _
"394643", _
"399171", _
"401663", _
"391954", _
"392645", _
"390587", _
"414141", _
"395859", _
"402663", _
"399440", _
"401748", _
"405370", _
"410816", _
"399707", _
"413511", _
"408825", _
"406016", _
"413812", _
"395005", _
"395397", _
"403824", _
"410974", _
"411214", _
"391296", _
"400465", _
"402668", _
"407752", _
"401766", _
"404078", _
"408884", _
"412577", _
"411229", _
"403830", _
"395973", _
"410131", _
"410853", _
"410678", _
"402243", _
"407872", _
"416304", _
"410358", _
"402239", _
"397402", _
"398564", _
"413154", _
"414077", _
"409921", _
"410825", _
"393130", _
"407692", _
"414431", _
"405958", _
"398837", _
"392550", _
"413028", _
"402882", _
"402357", _
"397272", _
"394195", _
"401911", _
"401329", _
"390879", _
"397281", _
"400722", _
"403502", _
"393434", _
"394119", _
"411844", _
"401947", _
"398292", _
"414684", _
"402434", _
"391626", _
"414118", _
"407743", _
"411763", _
"395946", _
"403066", _
"410577", _
"410623", _
"403081", _
"391288", _
"413045", _
"403159", _
"404674", _
"415470", _
"395160", _
"398595", _
"402509", _
"406278", _
"405743", _
"398904", _
"415674", _
"403926", _
"406438", _
"401757", _
"402568", _
"405929", _
"410661", _
"390850", _
"404755", _
"408607", _
"408681", _
"404246", _
"396162", _
"406544", _
"412182", _
"402573", _
"391298", _
"412436", _
"411620", _
"406986", _
"399475", _
"395537", _
"400889", _
"401776", _
"402389", _
"403304", _
"407445", _
"397162", _
"411327", _
"404618", _
"401926", _
"399375", _
"409690", _
"413247", _
"396051", _
"416206", _
"391680", _
"411600", _
"411549", _
"390545", _
"390640", _
"395343", _
"409907", _
"398886", _
"413281", _
"394744", _
"398206", _
"406036", _
"411780", _
"408374", _
"398202", _
"414043", _
"406251", _
"391292", _
"401508", _
"393866", _
"414761", _
"404480", _
"394485", _
"407409", _
"409061", _
"410161", _
"392576", _
"402184", _
"403578", _
"395167", _
"405253", _
"409399", _
"403596", _
"410855", _
"393239", _
"407225", _
"400379", _
"403444", _
"413564", _
"401847", _
"404061", _
"410809", _
"414015", _
"402953", _
"410126", _
"405621", _
"405055", _
"403024", _
"410336", _
"413586", _
"396486", _
"402856", _
"409078", _
"403573", _
"413834", _
"390641", _
"408382", _
"391315", _
"398829", _
"401956", _
"413290", _
"408805", _
"392122", _
"396872", _
"402363", _
"397808", _
"414664", _
"394365", _
"406728", _
"404069", _
"403557", _
"398157", _
"408912", _
"402582", _
"411539", _
"392587", _
"393968", _
"402873", _
"400172", _
"410361", _
"412769", _
"405847", _
"404998", _
"411777", _
"392582", _
"391028", _
"401917", _
"407046", _
"401457", _
"399742", _
"408688", _
"413735", _
"410986", _
"394338", _
"401770", _
"411411", _
"410970", _
"413057", _
"391318", _
"396600", _
"397524", _
"411809", _
"405952", _
"391937", _
"404141", _
"392018", _
"409451", _
"408964", _
"410097", _
"403567", _
"396492", _
"409801", _
"396820", _
"390642", _
"404100", _
"393964", _
"410292", _
"398186", _
"397838", _
"413378", _
"402427", _
"395140", _
"408984", _
"400668", _
"409051", _
"393403", _
"413372", _
"414270", _
"403269", _
"395370", _
"396070", _
"412777", _
"392620", _
"399698", _
"413344", _
"409644", _
"401903", _
"391923", _
"399620", _
"415203", _
"398816", _
"402440", _
"402556", _
"391399", _
"413862", _
"398934", _
"408349", _
"398282", _
"403524", _
"401440", _
"405166", _
"404978", _
"402193", _
"404760", _
"403377", _
"394327", _
"402678", _
"411277", _
"401421", _
"409623", _
"395963", _
"400841", _
"396158", _
"400818", _
"392136", _
"397878", _
"411088", _
"403957", _
"402395", _
"393354", _
"410568", _
"392527", _
"404051", _
"396807", _
"393453", _
"394314", _
"415587", _
"400836", _
"410093", _
"394223", _
"398801", _
"399952", _
"407754", _
"394389", _
"398484", _
"407835", _
"407829", _
"409386", _
"394198", _
"401920", _
"403019", _
"395174", _
"401619", _
"406631", _
"400144", _
"392615", _
"407442", _
"411002", _
"405382", _
"410748", _
"411443", _
"400708", _
"390711", _
"403814", _
"394214", _
"413255", _
"413331", _
"402571", _
"412773", _
"395421", _
"402273", _
"400398", _
"404757", _
"401471", _
"408871", _
"403532", _
"409977", _
"415429", _
"409862", _
"407188", _
"400607", _
"391661", _
"402214", _
"394160", _
"413007", _
"391311", _
"411850", _
"394939", _
"408285", _
"393527", _
"411025", _
"414375", _
"401690", _
"392733", _
"406280", _
"410820", _
"391886", _
"399054", _
"401434", _
"406267", _
"410997", _
"402985", _
"395358", _
"407411", _
"400153", _
"403074", _
"402096", _
"409510", _
"409208", _
"406193", _
"396480", _
"405727", _
"401411", _
"410619", _
"396510", _
"390586", _
"407182", _
"402847", _
"390776", _
"406282", _
"402964", _
"414116", _
"413013", _
"397690", _
"397444", _
"406973", _
"404444", _
"403888", _
"393579", _
"403472", _
"414164", _
"404504", _
"414892", _
"400075", _
"413788", _
"398650", _
"409234", _
"414058", _
"406742", _
"399314", _
"402683", _
"414910", _
"403996", _
"409929", _
"413660", _
"391802", _
"402101", _
"395047", _
"406274", _
"399220", _
"404565", _
"413375", _
"390557", _
"398026", _
"410804", _
"392573", _
"391649", _
"392916", _
"396297", _
"411604", _
"401252", _
"405673", _
"410528", _
"404778", _
"390565", _
"404624", _
"406568", _
"409620", _
"403923", _
"409075", _
"414177", _
"412131", _
"405894", _
"397015", _
"400180", _
"397448", _
"403972", _
"408270", _
"395950", _
"396498", _
"399715", _
"410805", _
"390784", _
"398023", _
"396887", _
"392099", _
"411868", _
"406257", _
"416277", _
"394995", _
"395958", _
"401400", _
"406233", _
"402947", _
"416085", _
"401262", _
"402579", _
"408516", _
"395511", _
"406704", _
"401190", _
"410624", _
"403882", _
"396961", _
"402973", _
"397769", _
"394493", _
"402674", _
"395830", _
"400897", _
"408703", _
"402655", _
"398034", _
"394169", _
"402396", _
"410791", _
"398320", _
"393724", _
"403497", _
"398019", _
"404633", _
"394727", _
"402180", _
"399893", _
"392196", _
"411224", _
"412553", _
"408247", _
"394865", _
"414809", _
"414671", _
"391643", _
"401908", _
"395526", _
"390722", _
"390481", _
"390582", _
"406142"}


    Public Function BuscaDigitalizada(ByVal Doc As String, ByVal Dat As DataSet, ByVal Lado As String, ByVal Vers As String) As String
        Dim Resp As String
        Dim i As Integer
        Resp = "No"
        Try
            For i = 0 To Dat.Tables(0).Rows.Count - 1
                If Doc = Dat.Tables(0).Rows(i).Item("KeyDocumento") And Lado.ToUpper = Dat.Tables(0).Rows(i).Item("Lado").ToString.ToUpper And Vers = Dat.Tables(0).Rows(i).Item("PVersion").ToString Then
                    Resp = "Si"
                    Exit For
                End If
            Next
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try
        Return Resp
    End Function

    Public Function BuscaCorrecta(ByVal Doc As String, ByVal Dat As DataSet, ByVal Lado As String) As String
        Dim Resp As String
        Dim i As Integer
        Resp = "No"
        Try
            For i = 0 To Dat.Tables(0).Rows.Count - 1
                If Doc = Dat.Tables(0).Rows(i).Item("KeyDocumento") And Lado.ToUpper = Dat.Tables(0).Rows(i).Item("Lado").ToString.ToUpper Then
                    If IsDBNull(Dat.Tables(0).Rows(i).Item("Correcta")) = True Then
                        Resp = "-"
                        Exit For
                    Else
                        If Dat.Tables(0).Rows(i).Item("Correcta") = True Then
                            Resp = "Si"
                            Exit For
                        Else
                            Resp = "No"
                            Exit For
                        End If

                    End If
                End If
            Next
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try

        Return Resp
    End Function

    Public Function NombreDoc(ByVal Doc As String, ByVal Dat As DataSet, ByVal Lado As String) As String
        Dim Resp As String
        Dim i As Integer
        Resp = ""
        Try
            For i = 0 To Dat.Tables(0).Rows.Count - 1
                If Doc = Dat.Tables(0).Rows(i).Item("KeyDocumento") And Lado = Dat.Tables(0).Rows(i).Item("Lado") Then
                    Resp = Dat.Tables(0).Rows(i).Item("DescDocumento")
                End If
            Next
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try

        Return Resp
    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim tTable As New DataTable
        Dim Sol, Tipo, Acc, tNewValues, tValues, KDoc, Lado, Ruta, Nombre, PVers, Conve1, Prod1, Transa, Aux(), Arch1, tiposol As String
        Dim Query As String
        Dim Ds As New DataSet
        Dim Ds1 As New DataSet
        Dim Ds1A As New DataSet
        Dim Ds2 As New DataSet
        Dim Ds3 As New DataSet
        Dim Ds4 As New DataSet
        Dim i, j As Integer
        Dim tRow As DataRow
        Dim tRespuesta As String
        'Dim tRow As DataRow
        Try
            ConnStr = ConfigurationManager.ConnectionStrings("Base").ConnectionString
            ConnStrB = ConfigurationManager.ConnectionStrings("BaseB").ConnectionString
            If Session("BuscarImg") = "1" Then 'RQ425
                Session("BuscarImg") = "0"
            Else
                'If Not IsPostBack Then'RQ921 AAAV
                Response.Write("<Script Language=Javascript>" & vbCrLf)
                Response.Write("VIDvar=" & Chr(34) & Request.QueryString("IdVar") & Chr(34) & ";" & vbCrLf)
                Response.Write("IdTipo=" & Chr(34) & Request.QueryString("IdTipo") & Chr(34) & ";" & vbCrLf)
                Response.Write("</Script>" & vbCrLf)
                Acc = Request.QueryString("IdAccion")
                DSService = New ServiciosWEB.Servicios
                Sol = Request.QueryString("IdVar")
                Tipo = Request.QueryString("IdTipo")
                Conve1 = ""
                Prod1 = ""
                If Sol <> "" Then
                    'If Sol.IndexOf("T") < 0 Then
                    Query = "* From SoSolicitudes Where IdSolicitud = '" & Sol & "'"
                    Ds1 = DSService.ConsultaGeneral(Query, ConnStr)
                    EstatusSol = Ds1.Tables(0).Rows(0).Item("KeyEstatusUltimaM")
                    Conve1 = Ds1.Tables(0).Rows(0).Item("KeyExpediente")
                    Prod1 = Ds1.Tables(0).Rows(0).Item("Cadena")
                    Transa = Ds1.Tables(0).Rows(0).Item("Transaccion")
                    tiposol = Ds1.Tables(0).Rows(0).Item("KeyTipoSolicitud")
                    Query = " * From ConvDatosBasicos Where Id = '" & Conve1 & "'"
                    Ds3 = DSService.ConsultaGeneral(Query, ConnStr)
                    Query = " * From ProdDatosGenerales Where Id = '" & Conve1 & "' And KeyProducto = '" & Prod1 & "'"
                    Ds4 = DSService.ConsultaGeneral(Query, ConnStr)
                    'Else
                    'EstatusSol = "Cap"
                    'End If
                Else
                    EstatusSol = "Cap"
                    tiposol = "Efe"
                End If

                Select Case Acc
                    Case "1" ' Alta
                        KDoc = Request.QueryString("IDoc")
                        Lado = Request.QueryString("Lado")
                        Ruta = Request.QueryString("Ruta")
                        Nombre = Request.QueryString("Nom")
                        PVers = Request.QueryString("Vers")
                        Aux = Split(Ruta, "/")
                        Arch1 = Aux(Aux.Length - 1)
                        tNewValues = "* From SoDocumentosXSolicitud Where IdSolicitud = '" & Sol & "' And KeyDocumento = '" & KDoc & "' And PVersion = '" & PVers & "' "
                        Ds1 = DSService.ConsultaGeneral(tNewValues, ConnStr)
                        If Ds1.Tables(0).Rows.Count = 0 Then
                            If File.Exists("D:\ArchivoDigital\Imgs\" & Arch1) = False Then
                                ErrorMsg.Text = "Hubo un error al recibir el documento por favor vuelva a escanearlo."

                            Else
                                tNewValues = "'" & KDoc & "','" & Sol & "','" & PVers & "','" & Lado & "','" & Ruta & "','False','" & Nombre & "',GetDate()"
                                tValues = tNewValues
                                tRespuesta = DSService.AltaDatos(Session("GUsuario"), Session("GNombreUsuario"), pProgramName, pTable, pFields, tValues, ConnStr, ConnStrB)
                            End If

                        End If
                        Session("NvaVersion") = ""
                    Case ""
                End Select

                If Session("NvaVersion") = "1" Then
                    'Button1.Text = "Generar Archivo Digital"
                    'Button1.Enabled = True
                    'Button2.Visible = False
                    'DataGrid1.SelectedIndex = -1
                    'Call Archivos()
                End If

                tTable.Columns.Add("Orden", Type.GetType("System.String")) '0'RQ425
                tTable.Columns.Add("Documento", Type.GetType("System.String")) '1
                tTable.Columns.Add("Lado", Type.GetType("System.String")) '2
                tTable.Columns.Add("Digitalizado", Type.GetType("System.String")) '3
                tTable.Columns.Add("Clave", Type.GetType("System.String")) '4
                tTable.Columns.Add("Correcto", Type.GetType("System.String")) '5
                tTable.Columns.Add("Opcional", Type.GetType("System.String")) '6
                tTable.Columns.Add("AgregaDoc", Type.GetType("System.String")) '7
                tTable.Columns.Add("AgregaDoc1", Type.GetType("System.String")) '8
                tTable.Columns.Add("PVersion", Type.GetType("System.String")) '9
                tTable.Columns.Add("Visible", Type.GetType("System.Boolean")) 'RQ425
                tTable.Columns.Add("SubirOk", Type.GetType("System.Boolean")) '11, RQ921 AAAV
                tTable.Columns.Add("msjSubir", Type.GetType("System.Boolean")) '12, RQ921 AAAV

                Ds1A = New DataSet
                Query = " KeyDocumento, IdSolicitud, MAX(PVersion) AS PVersion, Lado, Ruta, Correcta, DescDocumento From SoDocumentosXSolicitud Where IdSolicitud = '" & Sol & "' GROUP BY KeyDocumento, IdSolicitud, Lado, Ruta, Correcta, DescDocumento Order by KeyDocumento Asc, PVersion Desc"
                'RQ425, 'RQ921 AAAV
                Query = " * FROM( SELECT SDS.KeyDocumento, SDS.IdSolicitud, SDS.PVersion, SDS.Lado, SDS.Ruta, SDS.Correcta, SDS.DescDocumento, IsNULL(CorrectaImp,0) AS CorrectaImp, IsNULL(CorrectaETres,0) AS CorrectaETres, ROW_NUMBER() OVER(PARTITION BY SDS.KeyDocumento ORDER BY SDS.Fecha DESC) AS Linea FROM SoDocumentosXSolicitud AS SDS Where SDS.IdSolicitud = '" & Sol & "' ) MyTbl WHERE Linea = 1  "
                Ds1A = DSService.ConsultaGeneral(Query, ConnStr)

                Ds1 = New DataSet
                'RQ921 AAAV
                Query = " KeyDocumento, IdSolicitud, PVersion AS PVersion, Lado, Ruta, Correcta, DescDocumento, IsNULL(CorrectaImp,0) AS CorrectaImp, IsNULL(CorrectaETres,0) AS CorrectaETres From SoDocumentosXSolicitud Where IdSolicitud = '-1000'  "
                Ds1 = DSService.ConsultaGeneral(Query, ConnStr)

                For i = 0 To Ds1A.Tables(0).Rows.Count - 1
                    tRow = Ds1.Tables(0).NewRow
                    tRow(0) = Ds1A.Tables(0).Rows(i).Item(0)
                    tRow(1) = Ds1A.Tables(0).Rows(i).Item(1)
                    tRow(2) = Ds1A.Tables(0).Rows(i).Item(2)
                    tRow(3) = Ds1A.Tables(0).Rows(i).Item(3)
                    tRow(4) = Ds1A.Tables(0).Rows(i).Item(4)
                    tRow(5) = Ds1A.Tables(0).Rows(i).Item(5)
                    tRow(6) = Ds1A.Tables(0).Rows(i).Item(6)
                    tRow(7) = Ds1A.Tables(0).Rows(i).Item(7) 'RQ921 AAAV
                    tRow(8) = Ds1A.Tables(0).Rows(i).Item(8) 'RQ921 AAAV
                    Ds1.Tables(0).Rows.Add(tRow)
                Next

                If CInt(Transa) < 300000 Then
                    Query = " * From SoDocsXTiposDocumentos_old Where KeyTipoSolicitud = '" & Tipo & "' And DescDocumento <> 'Opcional' Order By Orden"
                Else
                    If tiposol = "CfA" Then
                        Query = " * From GenDocumentosPaquetes Where KeyPaquete = 'CfA' And DescDocumento <> 'Opcional' And Estatus = 'Cap' Order by orden"
                    ElseIf tiposol = "LiqP" Then
                        Query = " * From GenDocumentosPaquetes Where KeyPaquete = 'LiqP' And DescDocumento <> 'Opcional' And Estatus = 'Cap' Order by orden"
                    ElseIf tiposol = "PayDay" Then
                        If Ds4.Tables(0).Rows(0).Item("DescProducto").ToString.IndexOf("CREDIAMIGO EXPRESS 2C") > -1 Then
                            Query = " * From GenDocumentosPaquetes Where KeyPaquete = 'PayDay2C' And DescDocumento <> 'Opcional' And Estatus = 'Cap' Order by orden"
                        Else
                            Query = " * From GenDocumentosPaquetes Where KeyPaquete = 'PayDay' And DescDocumento <> 'Opcional' And Estatus = 'Cap' Order by orden"
                        End If
                    Else
                        If EstatusSol = "Cap" Or EstatusSol = "ExpI" Then
                            'Query = " * From SoDocsXTiposDocumentos Where KeyTipoSolicitud = '" & Tipo & "' And DescDocumento <> 'Opcional' And Estatus = 'Cap' And KeyConvenio = '" & Conve1 & "' Order By Orden"
                            Query = " * From GenDocumentosPaquetes Where KeyPaquete = '" & Ds3.Tables(0).Rows(0).Item("KeyPaquete") & "' And DescDocumento <> 'Opcional' And Estatus = 'Cap' Order by orden"
                        Else
                            If EstatusSol = "Pre" Or EstatusSol = "IRR2" Then
                                'Query = " * From SoDocsXTiposDocumentos Where KeyTipoSolicitud = '" & Tipo & "' And DescDocumento <> 'Opcional' And Estatus = 'Pre' And KeyConvenio = '" & Conve1 & "' Order By Orden"
                                Query = " * From GenDocumentosPaquetes Where KeyPaquete = '" & Ds3.Tables(0).Rows(0).Item("KeyPaquete") & "' And DescDocumento <> 'Opcional' And Estatus = 'Cap' Order by orden"
                            Else
                                'Query = " * From SoDocsXTiposDocumentos Where KeyTipoSolicitud = '" & Tipo & "' And DescDocumento <> 'Opcional' And Estatus = '" & EstatusSol & "' And KeyConvenio = '" & Conve1 & "' Order By Orden"
                                'Query = " * From GenDocumentosPaquetes Where KeyPaquete = '" & Ds3.Tables(0).Rows(0).Item("KeyPaquete") & "' And DescDocumento <> 'Opcional' And Estatus = '" & Respuesta.Tables(0).Rows(0).Item("KeyEstatusUltimaM") & "' Order by orden"
                                Query = " * From GenDocumentosPaquetes Where KeyPaquete = '" & Ds3.Tables(0).Rows(0).Item("KeyPaquete") & "' And DescDocumento <> 'Opcional' And Estatus = 'Cap' Order by orden"
                            End If

                        End If
                    End If
                End If

                Ds = DSService.ConsultaGeneral(Query, ConnStr)

                Ds2 = New DataSet
                If Sol <> "" Then
                    If CInt(Transa) < 300000 Then
                        Query = " SoDocumentosXSolicitud.* From SoDocumentosXSolicitud INNER JOIN SoDocsXTiposDocumentos_old " & _
                                " ON SoDocumentosXSolicitud.KeyDocumento = SoDocsXTiposDocumentos_old.KeyDocumento " & _
                                " Where SoDocumentosXSolicitud.IdSolicitud = '" & Sol & "' And SoDocsXTiposDocumentos_old.DescDocumento = 'Opcional' " & _
                                " Order by SoDocsXTiposDocumentos_old.KeyDocumento"
                    Else
                        'Query = " SoDocumentosXSolicitud.* From SoDocumentosXSolicitud INNER JOIN SoDocsXTiposDocumentos " & _
                        '        " ON SoDocumentosXSolicitud.KeyDocumento = SoDocsXTiposDocumentos.KeyDocumento " & _
                        '        " Where SoDocumentosXSolicitud.IdSolicitud = '" & Sol & "' And SoDocsXTiposDocumentos.DescDocumento = 'Opcional' " & _
                        '        " Order by SoDocsXTiposDocumentos.KeyDocumento"
                        Query = " SoDocumentosXSolicitud.* FROM GenDocumentosPaquetes INNER JOIN " & _
                                " SoDocumentosXSolicitud ON GenDocumentosPaquetes.KeyDocumento = SoDocumentosXSolicitud.KeyDocumento " & _
                                " Where SoDocumentosXSolicitud.IdSolicitud = '" & Sol & "' and GenDocumentosPaquetes.DescDocumento = 'Opcional'" & _
                                " Order by GenDocumentosPaquetes.KeyDocumento"
                        'RQ425
                        Query = " * FROM( SELECT SoDocumentosXSolicitud.*, IsNULL(CorrectaETres,0) AS CorrectaETresTwo, IsNULL(CorrectaImp,0) AS CorrectaImpTwo, ROW_NUMBER() OVER(PARTITION BY SoDocumentosXSolicitud.KeyDocumento ORDER BY SoDocumentosXSolicitud.Fecha DESC) AS Linea  " & _
                                " FROM GenDocumentosPaquetes INNER JOIN  " & _
                                " SoDocumentosXSolicitud ON GenDocumentosPaquetes.KeyDocumento = SoDocumentosXSolicitud.KeyDocumento  " & _
                                " WHERE SoDocumentosXSolicitud.IdSolicitud = '" & Sol & "' AND GenDocumentosPaquetes.DescDocumento = 'Opcional') MyTbl WHERE Linea = 1 "
                    End If
                End If
                'ErrorMsg.Text = Query
                Ds2 = DSService.ConsultaGeneral(Query, ConnStr)
                j = 1
                For i = 0 To Ds.Tables(0).Rows.Count - 1
                    Dim subirOk As Boolean = False 'RQ921 AAAV
                    If Ds.Tables(0).Rows(i).Item("AmbosLados") = True Then
                        tRow = tTable.NewRow
                        PVers = BuscaVersion(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente")
                        subirOk = SubirOkFunction(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente", EstatusSol) 'RQ921 AAAV
                        tRow(0) = j
                        tRow(1) = IIf(NombreDoc(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente") = "", Ds.Tables(0).Rows(i).Item("DescDocumento"), NombreDoc(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente"))
                        tRow(2) = "Frente"
                        tRow(3) = BuscaDigitalizada(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente", PVers)
                        tRow(4) = Ds.Tables(0).Rows(i).Item("KeyDocumento")
                        tRow(5) = BuscaCorrecta(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente")
                        tRow(6) = IIf(Ds.Tables(0).Rows(i).Item("Opcional") = True, "Si", "No")
                        tRow(7) = "SoAgregaImagenM.aspx?IDoc=" & Ds.Tables(0).Rows(i).Item("KeyDocumento") & "&Lado=Frente&Nom=" & System.Web.HttpUtility.UrlEncode(Ds.Tables(0).Rows(i).Item("DescDocumento")) & "&IdVar=" & Sol & "&IdTipo=" & Tipo & "&IDtemp=" & Request.QueryString("IDtemp")
                        tRow(8) = "SoImagenes.aspx?IdVar=" & Sol & "&IdTipo=" & Tipo & "&IDtemp=" & "&IDtemp=" & Request.QueryString("IDtemp")
                        tRow(9) = PVers
                        tRow(10) = IIf(CInt(PVers) > 1, True, False) 'RQ425
                        tRow(11) = IIf(subirOk, False, True) 'RQ921 AAAV 
                        tRow(12) = subirOk 'RQ921 AAAV 
                        tTable.Rows.Add(tRow)
                        j += 1
                        tRow = tTable.NewRow
                        PVers = BuscaVersion(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Reverso")
                        subirOk = SubirOkFunction(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Reverso", EstatusSol) 'RQ921 AAAV
                        tRow(0) = j
                        tRow(1) = IIf(NombreDoc(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Reverso") = "", Ds.Tables(0).Rows(i).Item("DescDocumento"), NombreDoc(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Reverso"))
                        tRow(2) = "Reverso"
                        tRow(3) = BuscaDigitalizada(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Reverso", PVers)
                        tRow(4) = Ds.Tables(0).Rows(i).Item("KeyDocumento")
                        tRow(5) = BuscaCorrecta(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Reverso")
                        tRow(6) = IIf(Ds.Tables(0).Rows(i).Item("Opcional") = True, "Si", "No")
                        tRow(7) = "SoAgregaImagenM.aspx?IDoc=" & Ds.Tables(0).Rows(i).Item("KeyDocumento") & "&Lado=Reverso&Nom=" & System.Web.HttpUtility.UrlEncode(Ds.Tables(0).Rows(i).Item("DescDocumento")) & "&IdVar=" & Sol & "&IdTipo=" & Tipo & "&IDtemp=" & Request.QueryString("IDtemp")
                        tRow(8) = "SoImagenes.aspx?IdVar=" & Sol & "&IdTipo=" & Tipo & "&IDtemp=" & "&IDtemp=" & Request.QueryString("IDtemp")
                        tRow(9) = PVers
                        tRow(10) = IIf(CInt(PVers) > 1, True, False) 'RQ425
                        tRow(11) = IIf(subirOk, False, True) 'RQ921 AAAV
                        tRow(12) = subirOk 'RQ921 AAAV 
                        tTable.Rows.Add(tRow)
                        j += 1
                    Else
                        tRow = tTable.NewRow
                        PVers = BuscaVersion(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente")
                        subirOk = SubirOkFunction(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente", EstatusSol) 'RQ921 AAAV
                        tRow(0) = j
                        tRow(1) = IIf(NombreDoc(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente") = "", Ds.Tables(0).Rows(i).Item("DescDocumento"), NombreDoc(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente"))
                        tRow(2) = "Frente"
                        tRow(3) = BuscaDigitalizada(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente", PVers)
                        tRow(4) = Ds.Tables(0).Rows(i).Item("KeyDocumento")
                        tRow(5) = BuscaCorrecta(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente")
                        tRow(6) = IIf(Ds.Tables(0).Rows(i).Item("Opcional") = True, "Si", "No")
                        tRow(7) = "SoAgregaImagenM.aspx?IDoc=" & Ds.Tables(0).Rows(i).Item("KeyDocumento") & "&Lado=Frente&Nom=" & System.Web.HttpUtility.UrlEncode(Ds.Tables(0).Rows(i).Item("DescDocumento")) & "&IdVar=" & Sol & "&IdTipo=" & Tipo & "&IDtemp=" & Request.QueryString("IDtemp")
                        tRow(8) = "SoImagenes.aspx?IdVar=" & Sol & "&IdTipo=" & Tipo & "&IDtemp=" & "&IDtemp=" & Request.QueryString("IDtemp")
                        tRow(9) = PVers
                        tRow(10) = IIf(CInt(PVers) > 1, True, False) 'RQ425
                        tRow(11) = IIf(subirOk, False, True) 'RQ921 AAAV
                        tRow(12) = subirOk 'RQ921 AAAV 
                        tTable.Rows.Add(tRow)
                        j += 1
                    End If
                Next
                For i = 0 To Ds2.Tables(0).Rows.Count - 1
                    Dim subirOk As Boolean = False 'RQ921 AAAV
                    If EstatusSol = "ExpI" Then
                        subirOk = CBool(Ds2.Tables(0).Rows(i).Item("CorrectaImpTwo"))
                    ElseIf EstatusSol = "IRR2" Then
                        subirOk = CBool(Ds2.Tables(0).Rows(i).Item("CorrectaETresTwo"))
                    End If
                    tRow = tTable.NewRow
                    tRow(0) = j
                    tRow(1) = Ds2.Tables(0).Rows(i).Item("DescDocumento")
                    tRow(2) = Ds2.Tables(0).Rows(i).Item("Lado")
                    tRow(3) = "Si"
                    tRow(4) = Ds2.Tables(0).Rows(i).Item("KeyDocumento")
                    tRow(5) = IIf(Ds2.Tables(0).Rows(i).Item("Correcta") = True, "Si", "No")
                    tRow(6) = "Si"
                    tRow(7) = "SoAgregaImagenM.aspx?IDoc=" & Ds2.Tables(0).Rows(i).Item("KeyDocumento") & "&Lado=" & Ds2.Tables(0).Rows(i).Item("Lado") & "&Nom=" & System.Web.HttpUtility.UrlEncode(Ds2.Tables(0).Rows(i).Item("DescDocumento")) & "&IdVar=" & Sol & "&IdTipo=" & Tipo & "&IDtemp=" & Request.QueryString("IDtemp")
                    tRow(8) = "SoImagenes.aspx?IdVar=" & Sol & "&IdTipo=" & Tipo & "&IDtemp=" & "&IDtemp=" & Request.QueryString("IDtemp")
                    tRow(9) = Ds2.Tables(0).Rows(i).Item("PVersion") 'RQ425
                    tRow(10) = IIf(CInt(Ds2.Tables(0).Rows(i).Item("PVersion")) > 1, True, False) 'RQ425
                    tRow(11) = IIf(subirOk, False, True) 'RQ921 AAAV
                    tRow(12) = subirOk 'RQ921 AAAV 
                    tTable.Rows.Add(tRow)
                    j += 1
                Next
                '*-*-* RQ1051 JAHC
                If Request.QueryString("IdVar") <> "" Then
                    Dim dtFormaFondeo As New DataTable
                    dtFormaFondeo = LlenaDt("SELECT CASE Folio WHEN '' THEN 'No' WHEN '0' THEN 'No' WHEN 'DISPERCION' THEN 'No' WHEN 'ERROR' THEN 'No' WHEN 'FOLIO ERROR' THEN 'No' WHEN 'NA' THEN 'No' ELSE 'Si' END AS 'Folio', " & _
                                            "CASE CLABE WHEN '' THEN 'No' ELSE 'Si' END AS 'CLABE', " & _
                                            "Referenciado FROM SoSolicitudes WHERE IdSolicitud = '" & Request.QueryString("IdVar") & "'", "SQL", ConnStr)
                    If dtFormaFondeo.Rows.Count > 0 Then
                        If dtFormaFondeo.Rows(0).Item("Referenciado") = "No" Then
                            For xRow As Integer = 0 To tTable.Rows.Count - 2
                                If dtFormaFondeo.Rows(0).Item("Folio") = "Si" And tTable.Rows(xRow).Item("Documento").ToString.Trim = "Estados de Cuenta" Then
                                    tTable.Rows(xRow).Delete()
                                ElseIf dtFormaFondeo.Rows(0).Item("CLABE") = "Si" And tTable.Rows(xRow).Item("Documento").ToString.Trim = "Copia de Cheque/Poliza" Then
                                    tTable.Rows(xRow).Delete()
                                End If
                            Next
                        End If
                    End If
                End If
                '*-*-*
                DataGrid1.DataSource = tTable
                DataGrid1.DataBind()
                HyperLink1.Text = "No Generado."
                HyperLink1.NavigateUrl = ""
                Call PuedeGenFile(tTable)
                Call ControlBotones()

                Dim strScript As String
                Dim value As Integer = CInt(Int((6 * Rnd()) + 1))
                strScript = "<script language=" & Chr(34) & "javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
                strScript = strScript & "window.parent.resizeTo(1024,768);" & Chr(10) & Chr(13)
                strScript = strScript & "</script>" & Chr(10) & Chr(13)
                ClientScript.RegisterClientScriptBlock(Me.GetType(), "WindowSize" & value, strScript)
            End If
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try

    End Sub

    Public Function BuscaVersion(ByVal KDoc As String, ByVal Das As DataSet, ByVal lado As String) As String 'RQ425
        Dim Resp As String
        Dim i As Integer
        Resp = "1"
        For i = 0 To Das.Tables(0).Rows.Count - 1
            If KDoc = Das.Tables(0).Rows(i).Item("KeyDocumento") And lado.ToUpper = Das.Tables(0).Rows(i).Item("Lado").ToString.ToUpper Then
                Resp = Das.Tables(0).Rows(i).Item("PVersion")
            End If
        Next
        Return Resp.ToString()
    End Function

    'RQ921 AAAV
    Public Function SubirOkFunction(ByVal KDoc As String, ByVal Das As DataSet, ByVal lado As String, ByVal EstatusSol As String) As Boolean
        Dim Resp As Boolean = False
        Dim i As Integer
        For i = 0 To Das.Tables(0).Rows.Count - 1
            If KDoc = Das.Tables(0).Rows(i).Item("KeyDocumento") And lado.ToUpper = Das.Tables(0).Rows(i).Item("Lado").ToString.ToUpper Then
                If EstatusSol = "ExpI" Then
                    Resp = CBool(Das.Tables(0).Rows(i).Item("CorrectaImp"))
                ElseIf EstatusSol = "IRR2" Then
                    Resp = CBool(Das.Tables(0).Rows(i).Item("CorrectaETres"))
                End If
            End If
        Next
        Return Resp
    End Function

    Public Sub PuedeGenFile(ByVal tTable As DataTable)
        Dim i, Si, No As Integer
        Si = 0
        No = 0
        Try
            For i = 0 To tTable.Rows.Count - 1
                If tTable.Rows(i).Item("Digitalizado") = "No" And tTable.Rows(i).Item("Opcional") = "No" Then
                    No += 1
                Else
                    Si += 1
                End If
            Next
            If No = 0 Then
                Button1.Enabled = True
            End If

            Dim Query As String
            Dim Ds1 As DataSet

            If Request.QueryString("IdVar") <> "" Then

                Query = "* From SoSolicitudesAttach Where IdSolicitud = '" & Request.QueryString("IdVar") & "' "
                DSService = New ServiciosWEB.Servicios
                Ds1 = DSService.ConsultaGeneral(Query, ConnStr)
                If Ds1.Tables(0).Rows.Count > 0 Then
                    Button1.Text = "Volver a Generar Archivo Digital"
                Else
                    Button1.Text = "Generar Archivo Digital"
                End If
                Call Archivos()
            End If
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try


    End Sub

    Public Sub ControlBotones()
        Dim Estatus As String
        Dim Dictamen As String
        Dim _flagExists As Boolean = False
        Try

            '-- RQ322 HN Se habilitan los botones del formulario dependiendo de estatus de la operación, rol del usuario y/o tipo de producto
            '-- RQ492 HN
            '-- RQ498 Re digitalizar
            '-- RQ549 HN
            If EstatusSol <> "Cap" And EstatusSol <> "Pen" And EstatusSol <> "ExpI" And EstatusSol <> "IRR2" And EstatusSol <> "Pre" Then
                'RQ568, RQ569, RQ570, RQ571, RQ575, RQ590, RQ591, RQ605, RQ615, RQ616, RQ634, RQ635 AAAV, RQ ??? JCPR, RQ646 HN
                '-- RQ648 HN
                Dim dsOperLibHabilitadas As DataSet = DSService.ConsultaGeneral(" IdSolicitud From SoHabilitaOperLib Where Habilitado = 'True'", ConnStr)
                Dim i As Integer
                For i = 0 To dsOperLibHabilitadas.Tables(0).Rows.Count - 1
                    If Request.QueryString("IdVar") = dsOperLibHabilitadas.Tables(0).Rows(i).Item(0).ToString Then
                        _flagExists = True
                        Exit For
                    End If
                Next

                If (EstatusSol = "Lib" And (Array.IndexOf(arrOperacionesBCS, Request.QueryString("IdVar")) <> -1 Or Array.IndexOf(arrOperacionesZacatecas, Request.QueryString("IdVar")) <> -1 Or _flagExists Or Session("GRol") = "RHSubdirector")) Or (EstatusSol = "PValIMSS" And Session("GRol") = "ValIMSS") Or (EstatusSol = "Imp" And Session("GRol") = "E3" And Request.QueryString("IdTipo") = "PayDay") Then
                    'If EstatusSol = "Lib" And Session("GRol") = "RHSubdirector" Then
                    Button1.Enabled = True
                ElseIf EstatusSol = "PLib" And _flagExists Then   'RQ651 AAAV
                    Button1.Enabled = True 'RQ651 AAAV
                Else
                    Button1.Enabled = False
                End If
                '--
                Button2.Enabled = False
            End If

            '-- RQ322 HN Se habilitan columnas de la grilla principal dependiendo de estatus de la operación, rol del usuario y/o tipo de producto
            '-- RQ492 HN
            '-- RQ498 Re digitalizar
            '-- RQ549 HN
            If EstatusSol <> "Cap" And EstatusSol <> "Pen" And EstatusSol <> "ExpI" And EstatusSol <> "IRR2" And EstatusSol <> "Pre" Then
                'RQ568, RQ569, RQ570, RQ571, RQ575, RQ590, RQ591, RQ605, RQ615, RQ616, RQ632, RQ634, RQ635 AAAV, RQ??? JCPR, RQ646 HN
                If (EstatusSol = "Lib" And (Array.IndexOf(arrOperacionesBCS, Request.QueryString("IdVar")) <> -1 Or Array.IndexOf(arrOperacionesZacatecas, Request.QueryString("IdVar")) <> -1 Or _flagExists Or Session("GRol") = "RHSubdirector")) Or (EstatusSol = "PValIMSS" And Session("GRol") = "ValIMSS") Or (EstatusSol = "Imp" And Session("GRol") = "E3" And Request.QueryString("IdTipo") = "PayDay") Then
                    'If EstatusSol = "Lib" And Session("GRol") = "RHSubdirector" Then
                    DataGrid1.Columns(7).Visible = True
                    DataGrid1.Columns(5).Visible = False
                ElseIf EstatusSol = "PLib" And _flagExists Then 'RQ651 AAAV
                    DataGrid1.Columns(7).Visible = True 'RQ651 AAAV
                    DataGrid1.Columns(5).Visible = False 'RQ651 AAAV
                Else
                    DataGrid1.Columns(5).Visible = True
                    DataGrid1.Columns(8).Visible = False
                End If
            Else
                DataGrid1.Columns(7).Visible = True
                DataGrid1.Columns(5).Visible = False
            End If
            '*-*-* RQ1024 JAHC Referente al RQ1054
            Dim dtVerificaCandado As New DataTable
            dtVerificaCandado = LlenaDt("SELECT * From SoHabilitaOperLib Where Habilitado = 'True' AND IdSolicitud = '" & Request.QueryString("IdVar") & "'", "SQL", ConnStr)
            If dtVerificaCandado.Rows.Count > 0 Then
                DataGrid1.Columns(8).Visible = True
                Button1.Enabled = True
            End If
            '*-*-*
            Dim Query As String = " * from VerificTelDictamen " & _
                                " inner join cat_DictamenValTel on cat_DictamenValTel.IdDictamen = VerificTelDictamen.Dictamen " & _
                                " Where IdSolicitud = '" & Request.QueryString("IdVar") & "' "

            Respuesta = New DataSet
            Respuesta = DSService.ConsultaGeneral(Query, ConnStr)

            If Respuesta.Tables(0).Rows.Count > 0 Then
                Dictamen = Respuesta.Tables(0).Rows(0).Item("DescDictamen")
            End If

            If Dictamen = "VALIDACION INCOMPLETA" Then
                Button1.Enabled = True 'Botón Docs
            End If

        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try


    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim Resp, Query, Ruta1, Temp() As String
        Dim Ds1, Ds2 As DataSet
        Dim i As Integer
        DSService = New ServiciosWEB.Servicios
        Try
            '*-*-* RQ1063 EC JAHC REFERENTE AL RQ1051
            Dim dtValidaObligatorio As DataTable
            dtValidaObligatorio = LlenaDt("SELECT CASE Folio WHEN '' THEN 'No' WHEN '0' THEN 'No' WHEN 'DISPERCION' THEN 'No' WHEN 'ERROR' THEN 'No' WHEN 'FOLIO ERROR' THEN 'No' WHEN 'NA' THEN 'No' ELSE 'Si' END AS 'Folio', " & _
                                            "CASE CLABE WHEN '' THEN 'No' ELSE 'Si' END AS 'CLABE', " & _
                                            "Referenciado FROM SoSolicitudes WHERE IdSolicitud = '" & Request.QueryString("IdVar") & "'", "SQL", ConnStr)
            For iValida As Integer = 0 To DataGrid1.Items.Count - 1
                If dtValidaObligatorio.Rows(0).Item("Folio") = "Si" And DataGrid1.Items(iValida).Cells(2).Text.Trim = "Copia de Cheque/Poliza" And DataGrid1.Items(iValida).Cells(4).Text.Trim = "No" Then
                    ErrorMsg.Text = "No se ha digitalizado la 'Copia de Cheque/Poliza'"
                    Exit Sub
                ElseIf dtValidaObligatorio.Rows(0).Item("CLABE") = "Si" And DataGrid1.Items(iValida).Cells(2).Text.Trim = "Estados de Cuenta" And DataGrid1.Items(iValida).Cells(4).Text.Trim = "No" Then
                    ErrorMsg.Text = "No se ha digitalizado el(los) 'Estados de Cuenta'"
                    Exit Sub
                End If
            Next
            '*-*-*
            Query = "* From SoDocumentosXSolicitud Where IdSolicitud = '" & Request.QueryString("IdVar") & "'"
            Ds1 = DSService.ConsultaGeneral(Query, ConnStr)
            Ruta1 = "D:\ArchivoDigital\Imgs\"
            For i = 0 To Ds1.Tables(0).Rows.Count - 1
                Temp = Split(Ds1.Tables(0).Rows(i).Item("Ruta"), "/")
                If File.Exists(Ruta1 & Temp(Temp.Length - 1)) = False Then
                    ErrorMsg.Text = "Por un error técnico el documento " & Ds1.Tables(0).Rows(i).Item("DescDocumento") & " (" & Ds1.Tables(0).Rows(i).Item("KeyDocumento") & ") NO se agregó al sistema, por favor digitalicelo de nuevo. Gracias!"
                    Query = "Delete From SoDocumentosXSolicitud Where IdSolicitud = '" & Request.QueryString("IdVar") & "' " & _
                            " And OpId = '" & Ds1.Tables(0).Rows(i).Item("OpId") & "'"
                    'ErrorMsg.Text = Query
                    Ds2 = DSService.COmando(Query, ConnStr)
                    Exit Sub
                End If
            Next
            Resp = DSService.CreaDocDigitalVer(Session("GUsuario"), Session("GNombreUsuario"), Session("GRol"), Request.QueryString("IdVar"), Request.QueryString("IdTipo"), ConnStr, ConnStrB)
            If Resp.ToUpper.IndexOf("EXITOSAMENTE") >= 0 Then
                Call Archivos()
            End If
            ErrorMsg.Text = Resp
            'Dim Ruta, Ruta1, Query, Sol, Tipo, Temp(), tKey, tRespuesta As String
            'Dim document1 As Document = New Document()
            'Dim Segu As New SecurityManager
            'Dim Ds1 As New DataSet
            'Dim Ds3 As New DataSet
            'Dim i As Integer
            'Dim stream123 As FileStream

            'Try
            '    DSService = New ServiciosWEB.Servicios
            '    Query = "* From SegOpcionesPDF Where KeyRol = '" & Session("GRol") & "'"
            '    Ds3 = DSService.ConsultaGeneral(Query, ConnStr)
            '    Sol = Request.QueryString("IdVar")
            '    tKey = " IdSolicitud = '" & Request.QueryString("IdVar") & "'"
            '    tRespuesta = DSService.BajaDatos(Session("GUsuario"), Session("GNombreUsuario"), pProgramName, "SoSolicitudesAttach", tKey, ConnStr, ConnStrB)
            '    Tipo = Request.QueryString("IdTipo")
            '    document1.Title = "Expediente Crediamigo"
            '    document1.Author = "Crediamigo"
            '    document1.Creator = "Crediamigo_ERP"
            '    document1.Compress = True
            '    Segu.AllowCopy = Ds3.Tables(0).Rows(0).Item("AllowCopy")
            '    Segu.AllowEdit = Ds3.Tables(0).Rows(0).Item("AllowEdit")
            '    Segu.AllowHighQualityPrinting = Ds3.Tables(0).Rows(0).Item("AllowHighQualityPrinting")
            '    Segu.AllowPrint = Ds3.Tables(0).Rows(0).Item("AllowPrint")
            '    Segu.OwnerPassword = Ds3.Tables(0).Rows(0).Item("OwnerPassword")
            '    document1.SecurityManager = Segu            
            '    Query = " SoDocumentosXSolicitud.* FROM SoDocumentosXSolicitud " & _
            '            " Inner Join SoDocsXTiposDocumentos ON SoDocumentosXSolicitud.KeyDocumento = " & _
            '            " SoDocsXTiposDocumentos.KeyDocumento " & _
            '            " Where SoDocsXTiposDocumentos.KeyTipoSolicitud = '" & Tipo & "' " & _
            '            " And SoDocumentosXSolicitud.IdSolicitud = '" & Sol & "' " & _
            '            " Order by SoDocsXTiposDocumentos.Orden "
            '    Ds1 = DSService.ConsultaGeneral(Query, ConnStr)
            '    Dim page1 As Page
            '    Dim graphics1 As PDFGraphics
            '    Dim Image1 As Image
            '    For i = 0 To Ds1.Tables(0).Rows.Count - 1
            '        page1 = New Page(PageSize.Letter)
            '        graphics1 = page1.Graphics
            '        Temp = Split(Ds1.Tables(0).Rows(i).Item("Ruta"), "/")
            '        Dim imgFile As New FileStream(Ruta1 & Temp(Temp.Length - 1), FileMode.Open, FileAccess.Read, FileShare.ReadWrite)
            '        'Image1 = Image.FromFile(Ruta1 & Temp(Temp.Length - 1))
            '        Image1 = Image.FromStream(imgFile)
            '        'imgFile.Dispose()
            '        graphics1.DrawImage(Image1, 50, 50, 520, 700, PictureAlignment.TopLeft, SizeMode.Stretch, Nothing)
            '        imgFile.Close()
            '        Image1 = Nothing
            '        document1.Pages.Add(page1)
            '        Page = Nothing
            '        graphics1 = Nothing
            '    Next
            '    stream123 = New FileStream(Ruta & Sol & ".pdf", FileMode.Create, FileAccess.Write)
            '    document1.Generate(stream123)
            '    Segu = Nothing
            '    document1 = Nothing
            '    RegistraDoc(Session("GUsuario"), Session("GNombreUsuario"), Sol, Sol & ".pdf", Sol & ".pdf", ConnStr, ConnStrB)
            '    Button1.Text = "Volver a Generar Archivo"
            '    ErrorMsg.Text = "Archivo Generado Exitosamente"
            '    Call Archivos()
            'Catch ex As Exception
            '    ErrorMsg.Text = "No se puede generar el archivo(" & ex.Message & ")."
            'Finally
            '    If IsNothing(stream123) = False Then
            '        stream123.Flush()
            '        stream123.Close()
            '        stream123.Dispose()
            '    End If
            'End Try
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try









    End Sub

    Public Sub Archivos()
        Dim Query, Sol As String
        Dim value As Integer = CInt(Int((6 * Rnd()) + 1))
        Dim Ds1 As DataSet
        Try
            Sol = Request.QueryString("IdVar")
            Query = "* From SoSolicitudesAttach Where IdSolicitud = '" & Sol & "'"
            DSService = New ServiciosWEB.Servicios
            Ds1 = DSService.ConsultaGeneral(Query, ConnStr)

            If Ds1.Tables(0).Rows.Count = 0 Then
                HyperLink1.Text = "No Generado."
                HyperLink1.NavigateUrl = ""
                Buttonexp.Visible = False
            Else
                HyperLink1.Text = ""
                Buttonexp.Visible = True
                numidexpcred = Ds1.Tables(0).Rows(0).Item("IdSolicitud")
                'HyperLink1.NavigateUrl = Ds1.Tables(0).Rows(0).Item("Ruta")
                'HyperLink1.Target = "_blank"
            End If
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try



    End Sub

    Protected Sub Buttonexp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Buttonexp.Click
        Dim numidexp, Name1 As String
        Dim value As Integer = CInt(Int((6 * Rnd()) + 1))

        If numidexpcred = "" Then
            HyperLink1.Text = "No Generado."
            HyperLink1.NavigateUrl = ""
            Buttonexp.Visible = False
        Else
            numidexp = numidexpcred & ".pdf"
            Name1 = "D:\ArchivoDigital\" & numidexp
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType() = "application/octet-stream"
            Response.WriteFile(Name1)
            Response.AddHeader("content-disposition", "attachment; filename=" & numidexp & "")
            Response.Flush()
            Response.Close()
        End If

    End Sub

    Protected Sub DataGrid1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataGrid1.SelectedIndexChanged
        'RQ425
        Dim hdfVer As HiddenField = DirectCast(DataGrid1.SelectedItem.FindControl("hdfVer"), HiddenField)
        Dim lblVersion As Label = DirectCast(DataGrid1.SelectedItem.FindControl("lblVersion"), Label)
        lblVersion.Text = hdfVer.Value
        Mostrar(CInt(DataGrid1.SelectedIndex), hdfVer.Value)
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim strScript, Query, KDoc, Lado, Sol, Ruta, tNewValues, tValues, tKey, tRespuesta, x() As String
        Dim value As Integer = CInt(Int((6 * Rnd()) + 1))
        Dim Ds1 As DataSet
        Try
            Query = "* From SoDocumentosXSolicitud Where IdSolicitud = '" & Request.QueryString("IdVar") & "' And KeyDocumento = '" & DataGrid1.SelectedItem.Cells(6).Text & "' And Lado = '" & DataGrid1.SelectedItem.Cells(3).Text & "'"
            DSService = New ServiciosWEB.Servicios
            Ds1 = DSService.ConsultaGeneral(Query, ConnStr)

            Sol = Request.QueryString("IdVar")
            Session("KDoc") = DataGrid1.SelectedItem.Cells(6).Text
            Session("Lado") = DataGrid1.SelectedItem.Cells(3).Text
            Session("NvaVersion") = "1"

            'Ruta = Ds1.Tables(0).Rows(0).Item("Ruta")
            'x = Split(Ruta, "/")



            'tNewValues = "'" & KDoc & "','" & Sol & "','" & Lado & "','" & Ruta & "','False'"
            'tValues = tNewValues
            'tKey = " IdSolicitud = '" & Request.QueryString("IdVar") & "' And KeyDocumento = '" & DataGrid1.SelectedItem.Cells(6).Text & "' And Lado = '" & DataGrid1.SelectedItem.Cells(3).Text & "'"
            'tRespuesta = DSService.BajaDatos(Session("GUsuario"), Session("GNombreUsuario"), pProgramName, pTable, tKey, ConnStr, ConnStrB)

            'tValues = tNewValues
            tKey = " IdSolicitud = '" & Request.QueryString("IdVar") & "'"
            tRespuesta = DSService.BajaDatos(Session("GUsuario"), Session("GNombreUsuario"), pProgramName, "SoSolicitudesAttach", tKey, ConnStr, ConnStrB)

            strScript = "<script language=" & Chr(34) & "javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
            strScript = strScript & "window.parent.location.reload();" & Chr(10) & Chr(13)
            strScript = strScript & "</script>" & Chr(10) & Chr(13)
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "FileAttach" & value, strScript)
            Button1.Text = "Generar Archivo Digital"
            Button1.Enabled = True
            Button2.Visible = False
            DataGrid1.SelectedIndex = -1
            Call Archivos()
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try

    End Sub

    'RQ425
    Protected Sub lnkAtras_Command(sender As Object, e As System.Web.UI.WebControls.CommandEventArgs)
        Session("BuscarImg") = "1"
        Try
            Dim valores() As String = e.CommandArgument.ToString().Split("|")
            Dim versionO As Integer = CInt(valores(2))
            Dim index As Integer = CInt(valores(3)) - 1
            Dim lblVersion As Label = DirectCast(DataGrid1.Items(index).FindControl("lblVersion"), Label)

            If CInt(lblVersion.Text) = 1 Then
                Exit Sub
            ElseIf CInt(lblVersion.Text) > 1 Then
                lblVersion.Text = (CInt(lblVersion.Text) - 1).ToString()
            End If
            Mostrar(index, lblVersion.Text)
        Catch ex As Exception
            ErrorMsg.Text = ex.Message
        End Try
    End Sub

    Protected Sub lnkAdelante_Command(sender As Object, e As System.Web.UI.WebControls.CommandEventArgs)
        Session("BuscarImg") = "1"
        Try
            Dim valores() As String = e.CommandArgument.ToString().Split("|")
            Dim versionO As Integer = CInt(valores(2))
            Dim index As Integer = CInt(valores(3)) - 1
            Dim lblVersion As Label = DirectCast(DataGrid1.Items(index).FindControl("lblVersion"), Label)

            If CInt(lblVersion.Text) = versionO Then
                Exit Sub
            ElseIf CInt(lblVersion.Text) < versionO Then
                lblVersion.Text = (CInt(lblVersion.Text) + 1).ToString()
            End If
            Mostrar(index, lblVersion.Text)
        Catch ex As Exception
            ErrorMsg.Text = ex.Message
        End Try
    End Sub

    Sub Mostrar(ByVal index As Integer, ByVal ver As String)
        Dim strScript, Query As String
        Dim value As Integer = CInt(Int((6 * Rnd()) + 1))
        Dim Ds1 As DataSet

        Try
            Button2.Visible = True
            'Query = "* From SoDocumentosXSolicitud Where IdSolicitud = '" & Request.QueryString("IdVar") & "' And KeyDocumento = '" & DataGrid1.Items(index).Cells(6).Text & "' And Lado = '" & DataGrid1.Items(index).Cells(3).Text & "' And PVersion = '" & DataGrid1.Items(index).Cells(7).Text & "'"
            Query = "* From SoDocumentosXSolicitud Where IdSolicitud = '" & Request.QueryString("IdVar") & "' And KeyDocumento = '" & DataGrid1.Items(index).Cells(6).Text & "' And Lado = '" & DataGrid1.Items(index).Cells(3).Text & "' AND PVersion = " & ver
            'ErrorMsg.Text = Query
            DSService = New ServiciosWEB.Servicios
            Ds1 = DSService.ConsultaGeneral(Query, ConnStr)
            If Ds1.Tables(0).Rows.Count = 0 Then
                Exit Sub
            End If
            strScript = "<script language=" & Chr(34) & "javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
            strScript = strScript & "window.parent.document.Img1a.src='" & Ds1.Tables(0).Rows(0).Item("Ruta") & "';" & Chr(10) & Chr(13)
            strScript = strScript & "</script>" & Chr(10) & Chr(13)
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "FileAttach" & value, strScript)
            Button2.Enabled = True
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try
    End Sub
End Class