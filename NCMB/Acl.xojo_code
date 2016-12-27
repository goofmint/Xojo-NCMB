#tag Class
Protected Class Acl
	#tag Method, Flags = &h0
		Sub constructor(Optional fields as JSONItem)
		  if fields = nil then
		    return
		  end if
		  if fields.HasName("*") then
		    Dim publics as JSONItem = fields.Value("*")
		    if publics.HasName("read") then
		      self.publicRead = true
		    end if
		    if publics.HasName("write") then
		      self.publicWrite = true
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub roleRead(role as NCMB.Role, bol as Boolean)
		  Dim json as JSONItem = new JSONItem
		  
		  json.Value("role") = role
		  json.Value("read") = bol
		  
		  self.roleReads.Append(json)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub roleWrite(role as NCMB.Role, bol as Boolean)
		  Dim json as JSONItem = new JSONItem
		  
		  json.Value("role") = role
		  json.Value("write") = bol
		  
		  self.roleWrites.Append(json)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toJSON() As JSONItem
		  Dim json as JSONItem = new JSONItem
		  
		  if Self.publicRead or Self.publicWrite then
		    Dim publicJSON as JSONItem = new JSONItem
		    
		    if Self.publicRead then
		      publicJSON.Value("read") = Self.publicRead
		    end if
		    if Self.publicWrite then
		      publicJSON.Value("write") = Self.publicWrite
		    end if
		    json.Value("*") = publicJSON
		  end if
		  
		  
		  return json
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub userRead(user as NCMB.User, bol as Boolean)
		  Dim json as JSONItem = new JSONItem
		  
		  json.Value("user") = user
		  json.Value("read") =  bol
		  
		  self.userReads.Append(json)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub userWrite(user as NCMB.User, bol as Boolean)
		  Dim json as JSONItem = new JSONItem
		  
		  json.Value("user") = user
		  json.Value("write") = bol
		  
		  self.userWrites.Append(json)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		publicRead As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		publicWrite As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		roleReads() As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		roleWrites() As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		userReads() As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		userWrites() As JSONItem
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="publicRead"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="publicWrite"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
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
