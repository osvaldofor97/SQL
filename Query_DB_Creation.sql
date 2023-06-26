/*
¡NOTA! : Antes de realizar cualquier proceso de eliminacion o borrado es importante tener en cuenta el orden de 
creacion de las tablas y sus llaves foraneas y otras restricciones posibles para evitar generar un error al momento
de correr el script
*/

/*SE DEBE PONER QUE BASE DE DATOS SE USARA*/
USE[NOMBRE_BD]
GO

/*SE CREA UN SCHEMA INICIAL EN CASO DE QUE NO EXISTA*/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'NOMBRE_DEL_SCHEMA_INICIAL')
EXEC('CREATE SCHEMA NOMBRE_DEL_SCHEMA_INICIAL')
GO

/*SE BORRAN LAS TABLAS EXISTENTES EN EL SCHEMA SI EXISTE ALGUNA*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DEL_SCHEMA_INICIAL.PrimeraTabla') AND type in (N'U'))
DROP TABLE NOMBRE_DEL_SCHEMA_INICIAL.PrimeraTabla
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DEL_SCHEMA_INICIAL.SegundaTabla') AND type in (N'U'))
DROP TABLE NOMBRE_DEL_SCHEMA_INICIAL.SegundaTabla
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DEL_SCHEMA_INICIAL.TerceraTabla') AND type in (N'U'))
DROP TABLE NOMBRE_DEL_SCHEMA_INICIAL.TerceraTabla
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DEL_SCHEMA_INICIAL.CuartaTabla') AND type in (N'U'))
DROP TABLE NOMBRE_DEL_SCHEMA_INICIAL.CuartaTabla
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DEL_SCHEMA_INICIAL.QuintaTabla') AND type in (N'U'))
DROP TABLE NOMBRE_DEL_SCHEMA_INICIAL.QuintaTabla
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DEL_SCHEMA_INICIAL.SextaTabla') AND type in (N'U'))
DROP TABLE NOMBRE_DEL_SCHEMA_INICIAL.SextaTabla
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DEL_SCHEMA_INICIAL.SeptimaTabla') AND type in (N'U'))
DROP TABLE NOMBRE_DEL_SCHEMA_INICIAL.SeptimaTabla
GO




/*SE CREAN LAS TABLAS EN EL SCHEMA [NOMBRE_DEL_SCHEMA_INICIAL]*/
CREATE TABLE [NOMBRE_DEL_SCHEMA_INICIAL].[SextaTabla] (
  [IDF_Id]                                    int PRIMARY KEY,
  [IDF_NumeroUnicoProceso]                    nvarchar(255),
  [IDF_NumeroAfiliados]                       nvarchar(100),
  [IDF_Fecha]                                 nvarchar(20),
  [IDF_NombreEmpresa]                         nvarchar(300),
  [IDF_NitEmpresa]                            nvarchar(15),
  [IDF_Telefono]                              nvarchar(15),
  [IDF_ReferenciaEmpresarial]                 nvarchar(50),
  [IDF_TipoPlan]                              nvarchar(255),
  [IDF_CorreoElectronico]                     nvarchar(300),
  [IDF_Direccion]                             nvarchar(100),
  [IDF_ValorTotalAfiliado]                    nvarchar(200),
  [IDF_ValorTotalEmpleador]                   nvarchar(200),
  [IDF_ValorTotalConsignacion]                nvarchar(200),
  [IDF_Afiliado]                              nvarchar(200),
  [IDF_Contingente]                           nvarchar(200),
  [IDF_Contribucion]                          nvarchar(200),
  [IDF_TipoPlanSAF]                           nvarchar(255),
  [IDF_ObservacionSAF]                        text,
  [IDF_Estado]                                nvarchar(100),
  [IDF_ProcesoDesde]                          nvarchar(100),
  [IDF_FechaDesglose]                         nvarchar(100),
  [IDF_FechaIngresoPartidas]                  nvarchar(100),
  [IDF_Valor]                                 nvarchar(100),
  [IDF_TipoInsumo]                            nvarchar(255),
  [IDF_TieneQuintaTabla]                    nvarchar(255),
  [IDF_IdDrivePlanillaOrginal]                nvarchar(255),
)
GO

CREATE TABLE [NOMBRE_DEL_SCHEMA_INICIAL].[PrimeraTabla] (
  [IA_Id]                                         int PRIMARY KEY,
  [IA_IdSextaTabla]                               int,
  [IA_IdQuintaTabla]                              int,
  [IA_NumeroRegistroPlanilla]                     nvarchar(100),
  [IA_Doc_Identificacion]                         nvarchar(300),
  [IA_Num_Encargo]                                nvarchar(30),
  [IA_Nombres_Apellidos]                          nvarchar(300),
  [IA_Ingresos_Novedades]                         nvarchar(200),
  [IA_Retiros_Novedades]                          nvarchar(200),
  [IA_Tipo_Aporte]                                nvarchar(100),
  [IA_Valor_Aporte_Afiliado_Empleado]             nvarchar(200),
  [IA_Cuenta_Contingente_Afiliado_Empleado]       nvarchar(255),
  [IA_Valor_Aporte_Contribucion_Empleador]        nvarchar(200),
  [IA_Cuenta_Contingente_Contribucion_Empleador]  nvarchar(255),
  [IA_NumeroUnicoAfiliado]                        nvarchar(255)
)
GO

CREATE TABLE [NOMBRE_DEL_SCHEMA_INICIAL].[QuintaTabla] (
  [NR_Id]                         int PRIMARY KEY,
  [NR_ObservacionSaf]             int,
  [NR_EstadoRegistro]             nvarchar(255),
  [NR_FechaNovedad]               nvarchar(20),
  [NR_CantidadDiasProcesamiento]  int,
  [NR_TipoNovedad]                nvarchar(255),
  [NR_IdDrivePlanillaNovedad]     int,
  [NR_CantidadDiasHabiles]        int
)
GO

CREATE TABLE [NOMBRE_DEL_SCHEMA_INICIAL].[CuartaTabla] (
  [RAM_NumeroUnicoProceso]                 nvarchar(255) PRIMARY KEY,
  [RAM_CodigoAsistente]                    nvarchar(255),
  [RAM_CodigoBot]                          nvarchar(255),
  [RAM_UsuarioDeRed]                       nvarchar(255),
  [RAM_NombreEstacion]                     nvarchar(255),
  [RAM_IPEstacion]                         nvarchar(255),
  [RAM_Estado_VerificarEstPlanilla]        nvarchar(30) NOT NULL CHECK ([RAM_Estado_VerificarEstPlanilla] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RAM_Observacion_VerificarEstPlanilla]   text,
  [RAM_Estado_VerificarTipoPlan]           nvarchar (30) NOT NULL CHECK ([RAM_Estado_VerificarTipoPlan] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RAM_Observacion_VerificarTipoPlan]      text,
  [RAM_Estado_ValRecursoSAF]               nvarchar(30) NOT NULL CHECK ([RAM_Estado_ValRecursoSAF] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RAM_Observacion_ValRecursoSAF]          text,
  [RAM_Estado_AplicarDesglose]             nvarchar(30) NOT NULL CHECK ([RAM_Estado_AplicarDesglose] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RAM_Observacion_AplicarDesglose]        text,
  [RAM_Estado_ValRegDuplicados]            nvarchar(30) NOT NULL CHECK ([RAM_Estado_ValRegDuplicados] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RAM_Observacion_ValRegDuplicados]       text,
  [RAM_Estado_ValAplicacionDesglose]       nvarchar(30) NOT NULL CHECK ([RAM_Estado_ValAplicacionDesglose] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RAM_Observacion_ValAplicacionDesglose]  text,
  [RAM_FechaInicioeEjecucion]              nvarchar(20),
  [RAM_HoraInicioEjecucion]                nvarchar(20),
  [RAM_FechaFinEjecucion]                  nvarchar(20),
  [RAM_HoraFinEjecucion]                   nvarchar(20)
)
GO

CREATE TABLE [NOMBRE_DEL_SCHEMA_INICIAL].[SeptimaTabla] (
  [RRD_NumeroUnicoProceso]                     nvarchar(255) PRIMARY KEY,
  [RRD_CodigoAsistente]                        nvarchar(255),
  [RRD_CodigoBot]                              nvarchar(255),
  [RRD_UsuarioDeRed]                           nvarchar(255),
  [RRD_NombreEstacion]                         nvarchar(255),
  [RRD_IPEstacion]                             nvarchar(255),
  [RRD_Estado_ActualizarArchivoRezagos]        nvarchar(30) NOT NULL CHECK ([RRD_Estado_ActualizarArchivoRezagos] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RRD_Observacion_ActualizarArchivoRezagos]   text,
  [RRD_Estado_ValCreacionDafuturoActivo]       nvarchar(30) NOT NULL CHECK ([RRD_Estado_ValCreacionDafuturoActivo] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RRD_Observacion_ValCreacionDafuturoActivo]  text,
  [RRD_Estado_Consulta360]                     nvarchar(30) NOT NULL CHECK ([RRD_Estado_Consulta360] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RRD_Observacion_Consulta360]                text,
  [RRD_Estado_ValRecursoSAF]                   nvarchar(30) NOT NULL CHECK ([RRD_Estado_ValRecursoSAF] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RRD_Observacion_ValRecursoSAF]              text,
  [RRD_Estado_AplicacionDesgloseManual]		nvarchar(30) NOT NULL CHECK ([RRD_Estado_AplicacionDesgloseManual] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RRD_Observacion_AplicacionDesgloseManual]   text,
  [RRD_FechaInicioeEjecucion]                  nvarchar(20),
  [RRD_HoraInicioEjecucion]                    nvarchar(20),
  [RRD_FechaFinEjecucion]                      nvarchar(20),
  [RRD_HoraFinEjecucion]                       nvarchar(20)
)
GO

CREATE TABLE [NOMBRE_DEL_SCHEMA_INICIAL].[SegundaTabla] (
  [RLT_NumeroUnicoProceso]                     nvarchar(255) PRIMARY KEY,
  [RLT_CodigoAsistente]                        nvarchar(255),
  [RLT_CodigoBot]                              nvarchar(255),
  [RLT_UsuarioDeRed]                           nvarchar(255),
  [RLT_NombreEstacion]                         nvarchar(255),
  [RLT_IPEstacion]                             nvarchar(255),
  [RLT_Estado_ValRecursosPI]                   nvarchar(30) NOT NULL CHECK ([RLT_Estado_ValRecursosPI] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLT_Observacion_ValRecursosPI]              text,
  [RLT_Estado_ConsultarRefActvSAF]             nvarchar(30) NOT NULL CHECK ([RLT_Estado_ConsultarRefActvSAF] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLT_Observacion_ConsultarRefActvSAF]        text,
  [RLT_Estado_LegalizacionSAF]                 nvarchar(30) NOT NULL CHECK ([RLT_Estado_LegalizacionSAF] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLT_Observacion_LegalizacionSAF]            text,
  [RLT_Estado_RegTimbreSAF]                    nvarchar(30) NOT NULL CHECK ([RLT_Estado_RegTimbreSAF] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLT_Observacion_RegTimbreSAF]               text,
  [RLT_Estado_AplicarDesgloseSAF]              nvarchar(30) NOT NULL CHECK ([RLT_Estado_AplicarDesgloseSAF] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLT_Observacion_AplicarDesgloseSAF]         text,
  [RLT_Estado_ValRegDuplicados]                nvarchar(30) NOT NULL CHECK ([RLT_Estado_ValRegDuplicados] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLT_Observacion_ValRegDuplicados]           text,
  [RLT_Estado_ValAplicacionDesgloseSAF]        nvarchar(30) NOT NULL CHECK ([RLT_Estado_ValAplicacionDesgloseSAF] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLT_Observacion_ValAplicacionDesgloseSAF]   text,
  [RLT_FechaInicioeEjecucion]                  nvarchar(20),
  [RLT_HoraInicioEjecucion]                    nvarchar(20),
  [RLT_FechaFinEjecucion]                      nvarchar(20),
  [RLT_HoraFinEjecucion]                       nvarchar(20)
)
GO

CREATE TABLE [NOMBRE_DEL_SCHEMA_INICIAL].[TerceraTabla] (
  [RLP_NumeroUnicoProceso]                     nvarchar(255) PRIMARY KEY,
  [RLP_CodigoAsistente]                        nvarchar(255),
  [RLP_CodigoBot]                              nvarchar(255),
  [RLP_UsuarioDeRed]                           nvarchar(255),
  [RLP_NombreEstacion]                         nvarchar(255),
  [RLP_IPEstacion]                             nvarchar(255),
  [RLP_Estado_VerfFechaLegalizar]              nvarchar(30) NOT NULL CHECK ([RLP_Estado_VerfFechaLegalizar] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLP_Observacion_VerfFechaLegalizar]         text,
  [RLP_Estado_ValRecursoSAF]                   nvarchar(30) NOT NULL CHECK ([RLP_Estado_ValRecursoSAF] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLP_Observacion_ValRecursoSAF]              text,
  [RLP_Estado_AplicarDesgloseSAF]              nvarchar(30) NOT NULL CHECK ([RLP_Estado_AplicarDesgloseSAF] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLP_Observacion_AplicarDesgloseSAF]         text,
  [RLP_Estado_ValRegDuplicados]                nvarchar(30) NOT NULL CHECK ([RLP_Estado_ValRegDuplicados] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLP_Observacion_ValRegDuplicados]           text,
  [RLP_Estado_ValAplicacionDesgloseSAF]        nvarchar(30) NOT NULL CHECK ([RLP_Estado_ValAplicacionDesgloseSAF] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RLP_Observacion_ValAplicacionDesgloseSAF]   text,
  [RLP_FechaInicioeEjecucion]                  nvarchar(20),
  [RLP_HoraInicioEjecucion]                    nvarchar(20),
  [RLP_FechaFinEjecucion]                      nvarchar(20),
  [RLP_HoraFinEjecucion]                       nvarchar(20)
)
GO

/*SE CREA UN SCHEMA SECUNDARIO EN CASO DE QUE SEA NECESARIO*/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'NOMBRE_DE_SCHEMA_SECUNDARIO')
EXEC('CREATE SCHEMA NOMBRE_DE_SCHEMA_SECUNDARIO')
GO

/*SE BORRAN LAS TABLAS EXISTENTES EN EL SCHEMA SECUNDARIO SI EXISTE ALGUNA*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DE_SCHEMA_SECUNDARIO.OctabaTabla') AND type in (N'U'))
DROP TABLE NOMBRE_DE_SCHEMA_SECUNDARIO.OctabaTabla
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DE_SCHEMA_SECUNDARIO.NovenaTabla') AND type in (N'U'))
DROP TABLE NOMBRE_DE_SCHEMA_SECUNDARIO.NovenaTabla
GO



/*SE CREAN LAS TABLAS DEL SCHEMA SECUNDARIO*/
CREATE TABLE [NOMBRE_DE_SCHEMA_SECUNDARIO].[NovenaTabla](
    [PI_IDPartida]            int NOT NULL,
    [PI_Fecha]                nvarchar(20) NULL,
    [PI_Valor]                int NULL,
    [PI_Referencia]           int NULL,
    [PI_NroCuentaIndividual]  nvarchar(50) NULL,
    [PI_Observacion]          varchar(max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [NOMBRE_DE_SCHEMA_SECUNDARIO].[OctabaTabla](
    [RA_NumeroUnicoProceso]           nvarchar(255) NOT NULL,
    [RA_CodigoAsistente]              nvarchar(255) NULL,
    [RA_CodigoBot]                    nvarchar(255) NULL,
    [RA_UsuarioDeRed]                 nvarchar(255) NULL,
    [RA_NombreEstacion]               nvarchar(255) NULL,
    [RA_IPEstacion]                   nvarchar(255) NULL,
    [FechaRegistro]                   nvarchar(255) NULL,
    [RA_TipoProceso]                  nvarchar(255) NULL,
    [Valor]                           nvarchar(255) NULL,
    [Fecha_Consignacion]              nvarchar(50) NULL,
    [RA_EstadoBuscarPI]               nvarchar(100) NOT NULL,
    [RA_ObservacionBuscarPI]          text NULL,
    [RA_EstadoPManualPI]              nvarchar(100) NOT NULL,
    [RA_ObservacionPManualPI]         text NULL,
    [RA_EstadoPMasivoPI]              nvarchar(100) NOT NULL,
    [RA_ObservacionPMasivoPI]         text NULL,
    [RA_EstadoConsultarCargue]        nvarchar(100) NOT NULL,
    [RA_ObservacionConsultarCargue]   text NULL,
    [RA_FechaInicioeEjecucion]        nvarchar(20) NULL,
    [RA_HoraInicioEjecucion]          nvarchar(20) NULL,
    [RA_FechaFinEjecucion]            nvarchar(20) NULL,
    [RA_HoraFinEjecucion]             nvarchar(20) NULL,
PRIMARY KEY CLUSTERED 
(
    [RA_NumeroUnicoProceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [NOMBRE_DE_SCHEMA_SECUNDARIO].[OctabaTabla] ADD  DEFAULT ('No iniciado') FOR [RA_EstadoBuscarPI]
GO

ALTER TABLE [NOMBRE_DE_SCHEMA_SECUNDARIO].[OctabaTabla] ADD  DEFAULT ('No iniciado') FOR [RA_EstadoPManualPI]
GO

ALTER TABLE [NOMBRE_DE_SCHEMA_SECUNDARIO].[OctabaTabla] ADD  DEFAULT ('No iniciado') FOR [RA_EstadoPMasivoPI]
GO

ALTER TABLE [NOMBRE_DE_SCHEMA_SECUNDARIO].[OctabaTabla] ADD  DEFAULT ('No iniciado') FOR [RA_EstadoConsultarCargue]
GO

ALTER TABLE [NOMBRE_DE_SCHEMA_SECUNDARIO].[OctabaTabla]  WITH CHECK ADD CHECK  (([RA_EstadoBuscarPI]='No iniciado' OR [RA_EstadoBuscarPI]='Procesando' OR [RA_EstadoBuscarPI]='Exitoso, Procesado Parcialmente' OR [RA_EstadoBuscarPI]='No exitoso [Error de sistema]' OR [RA_EstadoBuscarPI]='No exitoso [Error controlado] ' OR [RA_EstadoBuscarPI]='Exitoso'))
GO

ALTER TABLE [NOMBRE_DE_SCHEMA_SECUNDARIO].[OctabaTabla]  WITH CHECK ADD CHECK  (([RA_EstadoPManualPI]='No iniciado' OR [RA_EstadoPManualPI]='Procesando' OR [RA_EstadoPManualPI]='Exitoso, Procesado Parcialmente' OR [RA_EstadoPManualPI]='No exitoso [Error de sistema]' OR [RA_EstadoPManualPI]='No exitoso [Error controlado] ' OR [RA_EstadoPManualPI]='Exitoso'))
GO

ALTER TABLE [NOMBRE_DE_SCHEMA_SECUNDARIO].[OctabaTabla]  WITH CHECK ADD CHECK  (([RA_EstadoPMasivoPI]='No iniciado' OR [RA_EstadoPMasivoPI]='Procesando' OR [RA_EstadoPMasivoPI]='Exitoso, Procesado Parcialmente' OR [RA_EstadoPMasivoPI]='No exitoso [Error de sistema]' OR [RA_EstadoPMasivoPI]='No exitoso [Error controlado] ' OR [RA_EstadoPMasivoPI]='Exitoso'))
GO

ALTER TABLE [NOMBRE_DE_SCHEMA_SECUNDARIO].[OctabaTabla]  WITH CHECK ADD CHECK  (([RA_EstadoConsultarCargue]='No iniciado' OR [RA_EstadoConsultarCargue]='Procesando' OR [RA_EstadoConsultarCargue]='Exitoso, Procesado Parcialmente' OR [RA_EstadoConsultarCargue]='No exitoso [Error de sistema]' OR [RA_EstadoConsultarCargue]='No exitoso [Error controlado] ' OR [RA_EstadoConsultarCargue]='Exitoso'))
GO

/*SE CREA UN SCHEMA TERCERO EN CASO DE QUE SEA NECESARIO*/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'NOMBRE_DE_SCHEMA_TERCERO')
EXEC('CREATE SCHEMA NOMBRE_DE_SCHEMA_TERCERO')
GO

/*SE BORRAN LAS TABLAS SI EXISTE ALGUNA DENTRO DEL SCHEMA TERCERO*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DE_SCHEMA_TERCERO.TablaDeReporte') AND type in (N'U'))
DROP TABLE NOMBRE_DE_SCHEMA_TERCERO.TablaDeReporte
GO

/*SE CREAN LAS TABLAS DEL SCHEMA TERCERO*/
CREATE TABLE [NOMBRE_DE_SCHEMA_TERCERO].[TablaDeReporte] (
  [ADA_ID]                  int PRIMARY KEY,
  [ADA_IpMaquina]           nvarchar(255),
  [ADA_NumeroCaso]          int,
  [ADA_Prioridad]           nvarchar(255),
  [ADA_NommbreAsistente]    nvarchar(255),
  [ADA_Estado]              nvarchar(255),
  [ADA_Descripcion]         nvarchar(255),
  [ADA_Aplicacion]          nvarchar(255),
  [ADA_SubProceso]          nvarchar(255)
)
GO

/*SE CREA UN SCHEMA CUARTO EN CASO DE QUE SEA NECESARIO*/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'NOMBRE_DE_SCHEMA_CUARTO')
EXEC('CREATE SCHEMA NOMBRE_DE_SCHEMA_CUARTO')
GO

/*SE BORRAN LAS TABLAS SI EXISTE ALGUNA DENTRO DEL SCHEMA CUARTO*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DE_SCHEMA_CUARTO.DecimaTabla') AND type in (N'U'))
DROP TABLE NOMBRE_DE_SCHEMA_CUARTO.DecimaTabla
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NOMBRE_DE_SCHEMA_CUARTO.UndecimaTabla') AND type in (N'U'))
DROP TABLE NOMBRE_DE_SCHEMA_CUARTO.UndecimaTabla
GO

/*SE CREAN LAS TABLAS DEL SCHEMA TERCERO*/
CREATE TABLE [NOMBRE_DE_SCHEMA_CUARTO].[UndecimaTabla] (
  [CM_NumeroUnicoProceso]           nvarchar(255) PRIMARY KEY,
  [CM_NIT]                          nvarchar(20),
  [CM_Empresa]                      nvarchar(255),
  [CM_Referencia_Empresarial]       nvarchar(30),
  [CM_FechaInsumo]                  nvarchar(255),
  [CM_EstadoProceso]                nvarchar(100) NOT NULL CHECK ([CM_EstadoProceso] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado'
)
GO

CREATE TABLE [NOMBRE_DE_SCHEMA_CUARTO].[DecimaTabla] (
  [RA_NumeroUnicoProceso]                   nvarchar(255) PRIMARY KEY,
  [RA_CodigoAsistente]                      nvarchar(255),
  [RA_CodigoBot]                            nvarchar(255),
  [RA_UsuarioDeRed]                         nvarchar(255),
  [RA_NombreEstacion]                       nvarchar(255),
  [RA_IPEstacion]                           nvarchar(255),
  [RA_Estado_Referencia_Empresarial]        nvarchar(100) NOT NULL CHECK ([RA_Estado_Referencia_Empresarial] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RA_Observacion_Referencia_Empresarial]   text,
 	[RA_Estado_Plantilla_SAF]                 nvarchar(100) NOT NULL CHECK ([RA_Estado_Plantilla_SAF] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
	[RA_Observacion_Plantilla_SAF]            text,
	[RA_Estado_Planilla_Sugerida]             nvarchar(100) NOT NULL CHECK ([RA_Estado_Planilla_Sugerida] IN ('Exitoso', 'No exitoso [Error controlado] ', 'No exitoso [Error de sistema]', 'Exitoso, Procesado Parcialmente' ,'Procesando', 'No iniciado')) DEFAULT 'No iniciado',
  [RA_Observacion_Planilla_Sugerida]        text,
  [RA_FechaInicioeEjecucion]                nvarchar(20),
  [RA_HoraInicioEjecucion]                  nvarchar(20),
  [RA_FechaFinEjecucion]                    nvarchar(20),
  [RA_HoraFinEjecucion]                     nvarchar(20)
)
GO


/*SE AÑADEN LAS LLAVES FORANEAS NECESARIAS*/
ALTER TABLE [NOMBRE_DEL_SCHEMA_INICIAL].[PrimeraTabla] ADD FOREIGN KEY ([IA_IdSextaTabla]) REFERENCES [NOMBRE_DEL_SCHEMA_INICIAL].[SextaTabla] ([IDF_Id])
GO

ALTER TABLE [NOMBRE_DEL_SCHEMA_INICIAL].[PrimeraTabla] ADD FOREIGN KEY ([IA_IdQuintaTabla]) REFERENCES [NOMBRE_DEL_SCHEMA_INICIAL].[QuintaTabla] ([NR_Id])
GO

ALTER TABLE [NOMBRE_DE_SCHEMA_CUARTO].[DecimaTabla] ADD FOREIGN KEY ([RA_NumeroUnicoProceso]) REFERENCES [NOMBRE_DE_SCHEMA_CUARTO].[UndecimaTabla] ([CM_NumeroUnicoProceso])
GO