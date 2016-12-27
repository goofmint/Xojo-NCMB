#tag Class
Protected Class Tests
Inherits TestGroup
	#tag Method, Flags = &h0
		Sub setKeys()
		  Dim applicationKey as string = "AAA"
		  Dim clientKey as String = "BBB"
		  
		  NCMB.setKeys(applicationKey, clientKey)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub signUpTest()
		  Dim user as NCMB.User
		  
		  Self.setKeys
		  
		  Dim userName as string = "user01"
		  Dim password as string = "password"
		  
		  if NCMB.User.signUp(userName, password) then
		    user = NCMB.User.getCurrentUser()
		    Assert.AreEqual(userName, str(user.get("userName")))
		    
		    if NCMB.User.signIn(userName, password) then
		      user = NCMB.User.getCurrentUser()
		      Assert.AreEqual(userName, str(user.get("userName")))
		    end if
		    if user.delete() then
		      Assert.IsFalse(NCMB.User.signIn(userName, password))
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Group="Behavior"
			Type="Boolean"
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
			Name="NotImplementedCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestCount"
			Group="Behavior"
			Type="Integer"
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
