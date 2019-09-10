<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Author>Administrator</Author>
  <LastAuthor>Administrator</LastAuthor>
  <Created>2008-09-11T17:22:52Z</Created>
  <LastSaved>2008-09-11T17:22:58Z</LastSaved>
  <Version>12.00</Version>
 </DocumentProperties>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>5715</WindowHeight>
  <WindowWidth>12765</WindowWidth>
  <WindowTopX>0</WindowTopX>
  <WindowTopY>105</WindowTopY>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Tahoma" x:Family="Swiss" ss:Size="11" ss:Color="#000000"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="5" ss:ExpandedRowCount="${books?size+2}" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="14.25">
    <Row>
        <Cell>
          <Data ss:Type="String">ID</Data>
        </Cell>
        <Cell>
          <Data ss:Type="String">名字</Data>
        </Cell>
        <Cell>
          <Data ss:Type="String">年龄</Data>
        </Cell>
        <Cell>
          <Data ss:Type="String">地址</Data>
        </Cell>
     </Row>
		
	<#if books?exists && books??>  <!-- 这里是给decisions这个对象做判空 -->
      <#list books as item>  <!-- 这里是给decisions这个对象做遍历 -->
      <Row>
        <Cell>
          <Data ss:Type="String">  ${item.id!'这个单元格为空'}  </Data>  <!-- 这里是给decisions这个对象的decisionCode做判空处理，若为空，则显示“这个单元格为空” -->
        </Cell>
        <Cell>
          <Data ss:Type="String">  ${item.name!''}  </Data> <!-- 这里是给decisions这个对象的decisionCode做判空处理，若为空，则不显示 -->
        </Cell>
        <Cell>
          <Data ss:Type="String">  ${item.age!''}  </Data>
        </Cell>
        <Cell>
          <Data ss:Type="String">  ${item.addr!''}  </Data>
        </Cell>
      </Row>
	  </#list>
     </#if>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Header x:Margin="0.3"/>
    <Footer x:Margin="0.3"/>
    <PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
   </PageSetup>
   <Selected/>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>

</Workbook>
