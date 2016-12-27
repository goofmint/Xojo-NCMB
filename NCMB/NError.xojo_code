#tag Class
Protected Class NError
	#tag Method, Flags = &h0
		Sub constructor(json as JSONItem)
		  if json = nil then
		    json = new JSONItem
		  end if
		  
		  self.code = json.Value("code")
		  self.error = json.Value("error")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(code as string, error as string)
		  self.code = code
		  self.error = error
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		code As String
	#tag EndProperty

	#tag Property, Flags = &h0
		error As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="code"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="error"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
