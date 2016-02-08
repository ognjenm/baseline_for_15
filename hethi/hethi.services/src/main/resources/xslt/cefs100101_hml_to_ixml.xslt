<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="http://xml.cxml.org/schemas/cXML/1.2.009/InvoiceDetail.dtd"/>
	<xsl:template match="/">
		<xsl:variable name="var1_initial" select="."/>
		<cXML>
			<xsl:for-each select="ixsdCefs100101">
				<xsl:variable name="var2_current" select="."/>
				<xsl:attribute name="version">
					<xsl:value-of select="floor(version)"/>
				</xsl:attribute>
			</xsl:for-each>
			<xsl:for-each select="ixsdCefs100101">
				<xsl:variable name="var3_current" select="."/>
				<Request>
					<InvoiceDetailRequest>
						<InvoiceDetailRequestHeader>
							<InvoicePartner>
								<Contact>
									<Name>
										<xsl:value-of select="vendor_name"/>
									</Name>
									<PostalAddress>
										<City>
											<xsl:value-of select="vendor_city"/>
										</City>
										<State>
											<xsl:value-of select="vendor_state"/>
										</State>
									</PostalAddress>
								</Contact>
							</InvoicePartner>
						</InvoiceDetailRequestHeader>
						<InvoiceDetailOrder>
							<InvoiceDetailItem>
								<xsl:attribute name="invoiceLineNumber">
									<xsl:value-of select="floor(cefs100101_lineitem/po_line_number)"/>
								</xsl:attribute>
								<xsl:attribute name="quantity">
									<xsl:value-of select="floor(cefs100101_lineitem/po_ordered_quantity)"/>
								</xsl:attribute>
								<UnitOfMeasure>
									<xsl:value-of select="floor(cefs100101_lineitem/po_ordered_quantity)"/>
								</UnitOfMeasure>
								<UnitPrice>
									<Money>
										<xsl:attribute name="currency">
											<xsl:value-of select="currency"/>
										</xsl:attribute>
										<xsl:attribute name="alternateAmount">
											<xsl:value-of select="floor(cefs100101_lineitem/po_extended_price)"/>
										</xsl:attribute>
									</Money>
								</UnitPrice>
								<InvoiceDetailItemReference>
									<Description>
										<xsl:value-of select="cefs100101_lineitem/part_description"/>
									</Description>
								</InvoiceDetailItemReference>
							</InvoiceDetailItem>
						</InvoiceDetailOrder>
					</InvoiceDetailRequest>
				</Request>
			</xsl:for-each>
		</cXML>
	</xsl:template>
</xsl:stylesheet>
