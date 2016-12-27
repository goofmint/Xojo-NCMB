#tag Class
Protected Class DataStore
	#tag Method, Flags = &h0
		Sub Constructor(name as String)
		  Self.name = name
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function delete_all(skip as Boolean = false) As Boolean
		  Dim dataItem as NCMB.DataStoreItem
		  
		  while self.fetchAll()
		    if Self.results.Ubound = 0 then
		      Exit
		    end if
		    For i as Integer = 0 To Self.results.Ubound
		      dataItem = Self.results(i)
		      if dataItem.delete() = false then
		        Self.error = new NCMB.NError("200", "Object delete error. " + dataItem.error.error)
		        if skip = false then
		          return false
		        end if
		      end if
		    Next
		  wend
		  
		  return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub equalTo(key as string, val as Variant)
		  if self.where = nil then
		    self.where = new JSONItem
		  end if
		  self.where.Value(key) = val
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function fetchAll() As Boolean
		  Dim response as JSONItem
		  Dim r As RuntimeException = new RuntimeException
		  Dim dataItem as NCMB.DataStoreItem
		  
		  Self.error = nil
		  
		  response  = NCMB.request.get(self.path, self.where)
		  
		  if response.HasName("code") then
		    // エラー
		    Self.error = new NCMB.NError(response)
		    return False
		  else
		    // 保存成功
		    response = response.value("results")
		    Redim Self.results(-1)
		    For i as integer = 0 to response.Count - 1
		      dataItem = Self.new_data
		      dataItem.set(response.Child(i))
		      Self.results.Append(dataItem)
		    Next
		    return True
		  end if
		  
		  return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function new_data() As NCMB.DataStoreItem
		  return new NCMB.DataStoreItem(Self.name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function path() As String
		  return "/2013-09-01/classes/"+Self.name
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		error As NCMB.NError
	#tag EndProperty

	#tag Property, Flags = &h0
		name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		results() As NCMB.DataStoreItem
	#tag EndProperty

	#tag Property, Flags = &h0
		where As JSONItem
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
