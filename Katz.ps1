$filename = 'number.xml';
$stylesheet = 'katz.xsl';
$xslt_settings = new-object System.XML.Xsl.XsltSettings
$xslt_settings.EnableScript = $true;
$xslt = new-object System.XML.Xsl.XslCompiledTransform
$xmlResolver = new-object System.XML.XmlUrlResolver
$xslt.Load($stylesheet, $xslt_settings, $xmlResolver)
$doc = new-object System.XML.XPath.XPathDocument($filename)
$settings = new-object System.XML.XmlWriterSettings
$settings.OmitXmlDeclaration = $true;
$settings.Indent = $true;
$writer = [System.Xml.XmlWriter]::Create("output.xml", $settings);
$xslt.Transform($doc, $writer);
$writer.Close();