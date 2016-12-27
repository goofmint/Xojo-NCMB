#tag Class
Protected Class DataStoreItem
Inherits NCMB.DataStore
	#tag Method, Flags = &h0
		Function delete() As boolean
		  Dim response as JSONItem
		  response  = NCMB.request.delete(self.path + "/" + self.objectId)
		  System.DebugLog(response.ToString)
		  if response.ToString = "{}" then
		    return True
		  else
		    Self.error = new NCMB.NError(response)
		    return False
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function get(key as string) As Variant
		  if key = "objectId" then
		    return self.objectId
		  end
		  if key = "createDate" then
		    return self.createDate
		  end if
		  
		  if self.fields = nil then
		    self.fields = new JSONItem
		  end if
		  return self.fields.Value(key)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function path() As String
		  return "/2013-09-01/classes/"+Self.name
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function save() As Boolean
		  Dim response as JSONItem
		  Dim r As RuntimeException = new RuntimeException
		  Dim createDate as date
		  
		  Self.error = nil
		  
		  
		  if Self.acl <> nil then
		    fields.Value("acl") = Self.acl.toJSON
		  end if
		  
		  if self.objectId = "" then
		    response  = NCMB.request.post(self.path, self.fields)
		  else
		    response  = NCMB.request.put(self.path, self.fields)
		  end if
		  
		  if response.HasName("code") then
		    // エラー
		    Self.error = new NCMB.NError(response)
		    return False
		  else
		    // 保存成功
		    Self.objectId = response.value("objectId")
		    if ParseDate(response.value("createDate"), createDate) = false then
		      // 日付のパース失敗
		      Self.objectId = ""
		      Self.error = new NCMB.NError("E000", "Parse date error" + response.value("createDate"))
		    else
		      Self.createDate = createDate
		    end if
		    return True
		  end if
		  
		  return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set(fields as JSONItem)
		  Dim key as string
		  For i as Integer = 0 to fields.Names.Ubound
		    key = fields.Name(i)
		    select case key
		    case "objectId"
		      self.objectId = fields.Value("objectId")
		    case "createDate"
		      Dim createDate as Date
		      if ParseDate(fields.value("createDate"), createDate) then
		        self.createDate = createDate
		      end if
		    case "updateDate"
		      Dim updateDate as Date
		      if ParseDate(fields.value("updateDate"), updateDate) then
		        self.updateDate = updateDate
		      end if
		    case "acl"
		      self.acl = new NCMB.Acl(fields.Value("acl"))
		    else
		      self.set(key, fields.Value(key))
		    end select
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub set(key as string, val as Variant)
		  if key = "objectId" then
		    self.objectId = str(val)
		    return
		  end if
		  
		  if key = "acl" then
		    self.acl = val
		    return
		  end
		  
		  if self.fields = nil then
		    self.fields = new JSONItem
		  end if
		  
		  if VarType(val) = val.TypeText then
		    val = str(val)
		  end if
		  
		  self.fields.Value(key) = val
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		acl As NCMB.Acl
	#tag EndProperty

	#tag Property, Flags = &h0
		createDate As Date
	#tag EndProperty

	#tag Property, Flags = &h0
		error As NCMB.NError
	#tag EndProperty

	#tag Property, Flags = &h0
		fields As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		objectId As String
	#tag EndProperty

	#tag Property, Flags = &h0
		query As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		updateDate As Date
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="objectId"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
