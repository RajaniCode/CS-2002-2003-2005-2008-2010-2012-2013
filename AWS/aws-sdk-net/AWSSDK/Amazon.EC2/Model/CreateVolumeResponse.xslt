<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ec2="default-ec2-namespace" exclude-result-prefixes="ec2">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
    <xsl:template match="ec2:CreateVolumeResponse">
        <xsl:element name="CreateVolumeResponse">
            <xsl:element name="ResponseMetadata">
                <xsl:element name="RequestId">
                    <xsl:value-of select="ec2:requestId"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="CreateVolumeResult">
                <xsl:element name="Volume">
                    <xsl:element name="VolumeId">
                        <xsl:value-of select="ec2:volumeId"/>
                    </xsl:element>
                    <xsl:element name="Size">
                        <xsl:value-of select="ec2:size"/>
                    </xsl:element>
                    <xsl:element name="SnapshotId">
                        <xsl:value-of select="ec2:snapshotId"/>
                    </xsl:element>
                    <xsl:element name="AvailabilityZone">
                        <xsl:value-of select="ec2:availabilityZone"/>
                    </xsl:element>
                    <xsl:element name="Status">
                        <xsl:value-of select="ec2:status"/>
                    </xsl:element>
                    <xsl:element name="CreateTime">
                        <xsl:value-of select="ec2:createTime"/>
                    </xsl:element>
                    <xsl:element name="Progress">
                        <xsl:value-of select="ec2:progress"/>
                    </xsl:element>
                    <xsl:element name="IOPS">
                        <xsl:value-of select="ec2:iops"/>
                    </xsl:element>
                    <xsl:element name="VolumeType">
                        <xsl:value-of select="ec2:volumeType"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
