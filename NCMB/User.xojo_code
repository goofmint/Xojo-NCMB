#tag Class
Protected Class User
Inherits NCMB.DataStoreItem
	#tag Method, Flags = &h0
		Sub constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor("user")
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function delete() As Boolean
		  Dim response as JSONItem
		  response  = NCMB.request.delete(self.path + "/" + self.objectId)
		  if response.ToString = "{}" then
		    return True
		  else
		    Self.error = new NCMB.NError(response)
		    return False
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function getCurrentUser() As NCMB.User
		  return NCMB.current_user
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function path() As string
		  return "/2013-09-01/users"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function signIn(userName as string, password as string) As Boolean
		  Dim fields As JSONItem = new JSONItem
		  fields.Value("userName") = userName
		  fields.Value("password")  = password
		  
		  Dim response as JSONItem = NCMB.request.get(NCMB.version + "login", fields)
		  
		  if response.HasName("code") then
		    // エラー
		    NCMB.error = new NCMB.NError(response)
		    return False
		  else
		    Dim user as NCMB.User
		    user.set(response)
		    NCMB.current_user = user
		    System.DebugLog(str(response))
		  end if
		  
		  return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function signUp(userName as string, password as string) As Boolean
		  Dim fields As JSONItem = new JSONItem
		  fields.Value("userName") = userName
		  fields.Value("password")  = password
		  
		  Dim response as JSONItem = NCMB.request.post(NCMB.version + "users", fields)
		  
		  if response.HasName("code") then
		    // エラー
		    NCMB.error = new NCMB.NError(response)
		    return False
		  else
		    NCMB.sessionToken = response.Value("sessionToken")
		    response.Remove("sessionToken")
		    
		    Dim user as NCMB.User = new NCMB.User
		    user.set(response)
		    NCMB.current_user = user
		  end if
		  
		  return True
		End Function
	#tag EndMethod


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
