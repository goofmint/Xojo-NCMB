#tag Module
Protected Module NCMB
	#tag Method, Flags = &h0
		Function applicationKey() As string
		  return request.application_key
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataStore(name as string) As NCMB.DataStore
		  return new NCMB.DataStore(name)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setKeys(application_key as string, client_key as String)
		  NCMB.request = new NCMB.NRequest(application_key, client_key)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		current_user As NCMB.User
	#tag EndProperty

	#tag Property, Flags = &h0
		error As NCMB.NError
	#tag EndProperty

	#tag Property, Flags = &h0
		request As NCMB.NRequest
	#tag EndProperty

	#tag Property, Flags = &h0
		sessionToken As string
	#tag EndProperty

	#tag Property, Flags = &h0
		version As string = "/2013-09-01/"
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
			Name="sessionToken"
			Group="Behavior"
			Type="string"
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
		#tag ViewProperty
			Name="version"
			Group="Behavior"
			InitialValue="/2013-09-01/"
			Type="string"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
