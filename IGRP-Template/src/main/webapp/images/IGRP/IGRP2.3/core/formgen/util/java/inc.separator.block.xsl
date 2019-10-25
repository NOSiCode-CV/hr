<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.separator" >
	
	<xsl:variable name="table" select="substring-after(@type,'separator_')"/>
	
		<xsl:variable name="mutation" select="mutation/@count"/>
		
		<xsl:variable name="dao_sep" select="field[@name='dao_sep']"/>
		
		<xsl:variable name="dao_seplow">
		
	       	<xsl:call-template name="LowerCase">
	       	
	       		<xsl:with-param name="text" select="$dao_sep"/>
	       		
	       	</xsl:call-template>
	       	
	   	</xsl:variable>
	   	
	   	<xsl:variable name="daofilter" select="concat($dao_seplow,'filter')"/>
		
		<xsl:variable name="andWheres">
		
			<xsl:call-template name="listar.andWheres">
			
				<xsl:with-param name="daofilter" select="$daofilter"/>
			
				<xsl:with-param name="total" select="$mutation"/>
				
				<xsl:with-param name="valueAttrName" select="'ADD'"/>
				
				<xsl:with-param name="values" select="value"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="table_up">
		
	       	<xsl:call-template name="InitCap">
	       	
	       		<xsl:with-param name="text" select="$table"/>
	       		
	       	</xsl:call-template>
	       	
	   	</xsl:variable>
	   	
	   	<xsl:variable name="sep_row">
	   	
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="*[@name='value2']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="rowvaluechildID" select="substring-after(value[@name='id_separator']/block/field,'::')"/>
		
		<xsl:variable name="ChildID">
		
			<xsl:call-template name="InitCap">
			
				<xsl:with-param name="text" select="$rowvaluechildID"/>
				
			</xsl:call-template>
			
		</xsl:variable>
	
		<xsl:variable name="code">
		
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
			<xsl:text>try{</xsl:text>
		
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:value-of select="$dao_sep"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao_sep"/><xsl:text>().find();</xsl:text>
			
			<xsl:value-of select="$andWheres"/>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>List&lt;</xsl:text><xsl:value-of select="$dao_sep"/><xsl:text>&gt; </xsl:text><xsl:value-of select="$dao_seplow"/><xsl:text>List = </xsl:text><xsl:value-of select="$daofilter"/><xsl:text>.all();</xsl:text>
			
			<xsl:value-of select="$newlineTab1"/>
			
			<xsl:text>if ( Core.isNotNull(</xsl:text><xsl:value-of select="$dao_seplow"/><xsl:text>List) ) {</xsl:text>
			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			
			<xsl:text>List &lt;</xsl:text><xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text>&gt; </xsl:text><xsl:text> separatorlistDocs =new ArrayList&lt;&gt;();</xsl:text>
			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			
			<xsl:value-of select="$dao_seplow"/><xsl:text>List.forEach(</xsl:text><xsl:value-of select="$dao_seplow"></xsl:value-of><xsl:text>-> {</xsl:text> 
			
			<xsl:value-of select="$newlineTab4"></xsl:value-of>
			
			<xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text> row = new </xsl:text><xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text>();</xsl:text>
			
			<xsl:value-of select="$newlineTab4"></xsl:value-of>
			
			<xsl:text>row.set</xsl:text><xsl:value-of select="$table_up"/><xsl:text>_id(new Pair( ""+ </xsl:text><xsl:value-of select="$dao_seplow"/><xsl:text>.get</xsl:text><xsl:value-of select="$ChildID"/><xsl:text>(), ""+</xsl:text><xsl:value-of select="$dao_seplow"/><xsl:text>.get</xsl:text><xsl:value-of select="$ChildID"/><xsl:text>()));</xsl:text>
			
			<xsl:value-of select="concat($newlineTab4,$sep_row)"></xsl:value-of>
			
			<xsl:value-of select="$newlineTab4"></xsl:value-of>
			
			<xsl:text>separatorlistDocs.add(row);</xsl:text> 
			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			
			<xsl:text>});</xsl:text> 
			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			
			<xsl:text>model.set</xsl:text><xsl:value-of select="$table_up"/><xsl:text>( separatorlistDocs);</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>}</xsl:text> 
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
				
			<xsl:text>}catch ( Exception e ) {</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>e.printStackTrace();</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>}</xsl:text> 
			
		</xsl:variable>
		
		<xsl:value-of select="$code"></xsl:value-of>
		
	</xsl:template>

	<xsl:template name="blockly.element.sep_row">
	
		<xsl:variable name="rowType" select="substring-before(@id,'::')"/>
		
		<xsl:variable name="rowValue" select="substring-after(@id,'::')"/>
		
		<xsl:variable name="rowtypechild" select="substring-before(value[@name='fields_model']/block/field,'::')"/>
		
		<xsl:variable name="rowvaluechild" select="substring-after(value[@name='fields_model']/block/field,'::')"/>
		
		<xsl:variable name="ValueChild">
		
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="value[@name='fields_model']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="nameCap">
		
			<xsl:call-template name="InitCap">
			
				<xsl:with-param name="text" select="$rowValue"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="valorpair">
		
			<xsl:call-template name="convert_blocks">
			
					<xsl:with-param name="daolow" select="daolow"></xsl:with-param>
					
					<xsl:with-param name="value" select="$ValueChild"></xsl:with-param>
					
					<xsl:with-param name="from" select="$rowtypechild"></xsl:with-param>
					
					<xsl:with-param name="to" select="$rowType"></xsl:with-param>
					
					<xsl:with-param name="neto" select="rowtypeneto"></xsl:with-param>
					
					<xsl:with-param name="valuechild" select="$rowvaluechild"></xsl:with-param>
					
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="rowset">
		
		<xsl:choose>
		
			<xsl:when test="contains($valorpair,'findDomain')">
			
				<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>( new Pair(</xsl:text><xsl:value-of select="$ValueChild"/><xsl:text>,</xsl:text><xsl:value-of select="$valorpair"/><xsl:text>) );</xsl:text>
			
			</xsl:when>
			
			<xsl:when test="$rowType = 'File'">
					
				<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>( new Pair(Core.getLinkFileByUuid(</xsl:text><xsl:value-of select="$ValueChild"/><xsl:text>),</xsl:text><xsl:value-of select="$ValueChild"/><xsl:text>!=null? Core.getFileNameByUuid(</xsl:text><xsl:value-of select="$ValueChild"/><xsl:text>):""));</xsl:text>
			
			</xsl:when>
			
			<xsl:otherwise>
			
				<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>( new Pair(</xsl:text><xsl:value-of select="$valorpair"/><xsl:text>,</xsl:text><xsl:value-of select="$valorpair"/><xsl:text>) );</xsl:text>
			
			</xsl:otherwise>
		
		</xsl:choose>
			
		</xsl:variable>
		
		<xsl:value-of select="$rowset"></xsl:value-of>
	
	</xsl:template>	
	
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template name="blockly.element.save_separator" >
		
		<xsl:variable name="dao_sep" select="field[@name='dao_sep']"/>
		
		<xsl:variable name="table" select="substring-after(@type,'save_sepator_')"/>
		
		<xsl:variable name="typedad" select="../../@type"/>
		
		<xsl:variable name="dao_seplow">
		
	       	<xsl:call-template name="LowerCase">
	       	
	       		<xsl:with-param name="text" select="$dao_sep"/>
	       		
	       	</xsl:call-template>
	       	
	   	</xsl:variable>
		
		<xsl:variable name="table_up">
		
	       	<xsl:call-template name="InitCap">
	       	
	       		<xsl:with-param name="text" select="$table"/>
	       		
	       	</xsl:call-template>
	       	
	   	</xsl:variable>
	   	
	   	<xsl:variable name="sep_insercao">
	   	
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="*[@name='value2']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="delete">
		
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="*[@name='delete']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
	
		<xsl:variable name="code">
		
			<xsl:choose>
				
				<xsl:when test="$typedad != 'inserir_dao' ">
				
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>Session session = null;</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>Transaction transaction = null;</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>try{</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>session = Core.getSession(Core.defaultConnection());</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>transaction = session.getTransaction();</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>transaction.begin();</xsl:text>
					
				</xsl:when>

			</xsl:choose>
			
				<xsl:value-of select="$newlineTab2"></xsl:value-of>
				
				<xsl:text>List&lt;String&gt; editList = new ArrayList&lt;&gt;();</xsl:text>
						
				<xsl:value-of select="$newlineTab2"></xsl:value-of>
				
				<xsl:text>if(model.getP_</xsl:text><xsl:value-of select="$table"/><xsl:text>_edit() != null){</xsl:text>
				
				<xsl:value-of select="$newlineTab3"></xsl:value-of>
				
				<xsl:text>editList =  new ArrayList&lt;&gt;(Arrays.asList(model.getP_</xsl:text><xsl:value-of select="$table"></xsl:value-of><xsl:text>_edit()));</xsl:text>
				
				<xsl:value-of select="$newlineTab2"></xsl:value-of>
				
				<xsl:text>}</xsl:text>
				
				<xsl:value-of select="$newlineTab2"></xsl:value-of>
				
				<xsl:text>for(</xsl:text>
				
				<xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text> row : model.get</xsl:text><xsl:value-of select="$table_up"/><xsl:text>()){</xsl:text>
				
				<xsl:value-of select="$newlineTab3"></xsl:value-of>
				
				<xsl:value-of select="$dao_sep"/><xsl:text> </xsl:text><xsl:value-of select="$dao_seplow"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao_sep"/><xsl:text>();</xsl:text>
				
				<xsl:value-of select="$newlineTab3"></xsl:value-of>
				
				<xsl:text>if( Core.isNotNull( row.get</xsl:text><xsl:value-of select="$table_up"/><xsl:text>_id())</xsl:text><xsl:text> &amp;&amp; Core.isNotNull( row.get</xsl:text><xsl:value-of select="$table_up"/><xsl:text>_id().getKey())){</xsl:text>
				
				<xsl:value-of select="$newlineTab4"></xsl:value-of>
				
				<xsl:text>if(!editList.isEmpty() &amp;&amp; editList.remove(row.get</xsl:text><xsl:value-of select="$table_up"/><xsl:text>_id().getKey())) {</xsl:text>
				
				<xsl:value-of select="$newlineTab5"></xsl:value-of>
				
				<xsl:value-of select="$dao_seplow"/><xsl:text> = session.find(</xsl:text><xsl:value-of select="$dao_sep"/><xsl:text>.class, Core.toInt(row.get</xsl:text><xsl:value-of select="$table_up"/><xsl:text>_id().getKey()));</xsl:text>
				
				<xsl:value-of select="$newlineTab4"></xsl:value-of>
				
				<xsl:text>}</xsl:text>
				
				<xsl:value-of select="$newlineTab4"></xsl:value-of>
				
				<xsl:text>else</xsl:text>
				
				<xsl:value-of select="$newlineTab5"></xsl:value-of>
				
				<xsl:text>continue;</xsl:text>
				
				<xsl:value-of select="$newlineTab3"></xsl:value-of>
				
				<xsl:text>}</xsl:text>
				
				<xsl:value-of select="$newlineTab4"></xsl:value-of>
				
				<xsl:value-of select="concat($newlineTab3,$sep_insercao)"></xsl:value-of> 
				
				<xsl:value-of select="$newlineTab3"></xsl:value-of>
				
				<xsl:text>session.persist(</xsl:text><xsl:value-of select="$dao_seplow"></xsl:value-of><xsl:text>);</xsl:text>
				
				<xsl:value-of select="$newlineTab2"></xsl:value-of>
				
				<xsl:text>}</xsl:text>
				
				<xsl:value-of select="$newlineTab1"></xsl:value-of>	
				
				<xsl:text>String [] deletedIdsArray = model.getP_</xsl:text><xsl:value-of select="$table"/><xsl:text>_del();</xsl:text>
				
				<xsl:value-of select="$newlineTab1"></xsl:value-of>
				
				<xsl:text>if ( Core.isNotNull( deletedIdsArray ) ) {</xsl:text>
				
				<xsl:value-of select="$newlineTab1"></xsl:value-of>
				
				<xsl:text>for ( String docId : deletedIdsArray ) {</xsl:text>
				
				<xsl:value-of select="$newlineTab2"></xsl:value-of>
				
				<xsl:text>if ( Core.isNotNull( docId ) &amp;&amp; !docId.isEmpty() ) {</xsl:text>
				
				<xsl:value-of select="$newlineTab3"></xsl:value-of>
				
				<xsl:value-of select="$dao_sep"/><xsl:text> </xsl:text><xsl:value-of select="$dao_seplow"/><xsl:text> = session.find(</xsl:text><xsl:value-of select="$dao_sep"/><xsl:text>.class, Core.toInt(docId));</xsl:text>
				
				<xsl:value-of select="$newlineTab3"></xsl:value-of>
				
				<xsl:text>session.delete(</xsl:text><xsl:value-of select="$dao_seplow"/><xsl:text>);</xsl:text>
				
				<xsl:value-of select="$newlineTab3"></xsl:value-of>
				
				<xsl:text>}</xsl:text>
				
				<xsl:value-of select="$newlineTab2"></xsl:value-of>
				
				<xsl:text>}</xsl:text>
				
				<xsl:value-of select="$newlineTab1"></xsl:value-of>
				
				<xsl:text>}</xsl:text>
				
				<xsl:value-of select="$newlineTab1"></xsl:value-of>
				
			<xsl:choose>
				
				<xsl:when test="$typedad != 'inserir_dao' ">
				
					<xsl:value-of select="$newlineTab2"></xsl:value-of>	
					
					<xsl:text>transaction.commit();</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>	
					
					<xsl:text>Core.setMessageSuccess();</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>}catch ( Exception e ) {</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>e.printStackTrace();</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>Core.setMessageError("Error: "+ e.getMessage());</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>if (transaction != null)</xsl:text>
					
					<xsl:value-of select="$newlineTab3"></xsl:value-of>
					
					<xsl:text>transaction.rollback();</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>}finally {</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>if (session != null &amp;&amp; session.isOpen()) {</xsl:text>
					
					<xsl:value-of select="$newlineTab3"></xsl:value-of>	
						
					<xsl:text>session.close();</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>	
					
					<xsl:text>}</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>	
					
					<xsl:text>}</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>	
						
				</xsl:when>

			</xsl:choose>
		
		</xsl:variable>
		
		<xsl:value-of select="$code"></xsl:value-of>
		
	</xsl:template>	
	
	<xsl:template name="blockly.element.get_row_sep">
	
		<xsl:variable name="rowType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="rowValue" select="substring-after(field,'::')"/>
		
		<xsl:variable name="rowtypechild" select="substring-before(value[@name='fields_model']/block/field,'::')"/>
		
		<xsl:variable name="rowvaluechild" select="substring-after(value[@name='fields_model']/block/field,'::')"/>
		
		<xsl:variable name="ValueChild">
		
			<xsl:call-template name="InitCap">
			
				<xsl:with-param name="text" select="$rowvaluechild"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="nameCap">
		
			<xsl:call-template name="InitCap">
			
				<xsl:with-param name="text" select="$rowValue"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:choose>
		
		<xsl:when test="$rowType = 'File'">
		
			<xsl:text>row.get</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of><xsl:text>().getFile()</xsl:text>
		
		</xsl:when>
		
		<xsl:otherwise>
		
			<xsl:text>row.get</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of><xsl:text>().getKey()</xsl:text>
		
		</xsl:otherwise>
		
		</xsl:choose>
	
	</xsl:template>	
	
</xsl:stylesheet>
		