#tag Class
Protected Class TestIgnore
Inherits TestGroup
	#tag Method, Flags = &h0
		Sub fetchAllTest()
		  Self.setKeys
		  
		  Dim DataClass as NCMB.DataStore
		  DataClass = new NCMB.DataStore("DataClass")
		  Dim dataItem as NCMB.DataStoreItem
		  
		  if DataClass.delete_all(true) = false then
		    System.DebugLog("Delete all error")
		    return
		  end if
		  
		  For i as Integer = 0 to 9
		    dataItem = DataClass.new_data
		    dataItem.set("msg", "Hello " + i.ToText)
		    if dataItem.save() then
		      System.DebugLog("Saved. " + dataItem.objectId)
		    end if
		  Next
		  
		  if DataClass.fetchAll() then
		    // 取得成功
		    Dim results() as NCMB.DataStoreItem = DataClass.results
		    Assert.AreEqual(results.Ubound, 10)
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub publicAclTest()
		  Dim acl as NCMB.Acl = new NCMB.Acl
		  
		  acl.publicRead = true
		  acl.publicWrite = false
		  
		  Assert.AreEqual(acl.toJSON.toString, "{""*"":{""read"":true}}")
		  
		  acl.publicWrite = true
		  Assert.AreEqual(acl.toJSON.toString, "{""*"":{""read"":true,""write"":true}}")
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub saveDataStoreFailTest()
		  Dim applicationKey as string = "aaa"
		  Dim clientKey as String = "bbb"
		  
		  NCMB.setKeys(applicationKey, clientKey)
		  
		  Dim DataClass as NCMB.DataStore
		  DataClass = new NCMB.DataStore("DataClass")
		  Dim dataItem as NCMB.DataStoreItem =  DataClass.new_data
		  dataItem.set("msg", "Hello")
		  
		  if dataItem.save() then
		    System.DebugLog("Saved")
		  else
		    Assert.AreEqual("E404005", dataItem.error.code)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub saveDataStoreTest()
		  Self.setKeys
		  
		  Dim DataClass as NCMB.DataStore
		  DataClass = new NCMB.DataStore("DataClass")
		  Dim dataItem as NCMB.DataStoreItem =  DataClass.new_data
		  dataItem.set("msg", "Hello")
		  
		  Try
		    if dataItem.save() then
		      Assert.AreNotEqual(dataItem.objectId, "")
		      System.DebugLog("Saved")
		    end if
		  Catch err as RuntimeException
		    System.DebugLog("ERROR : " + err.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub saveWithPublicAclTest()
		  Self.setKeys
		  
		  Dim DataClass as NCMB.DataStore
		  DataClass = new NCMB.DataStore("DataClass")
		  Dim dataItem as NCMB.DataStoreItem =  DataClass.new_data
		  dataItem.set("msg", "Hello")
		  
		  Dim acl as NCMB.Acl = new NCMB.Acl
		  acl.publicRead = true
		  acl.publicWrite = true
		  
		  dataItem.set("acl", acl)
		  
		  Try
		    if dataItem.save() then
		      Assert.AreNotEqual(dataItem.objectId, "")
		      System.DebugLog("Saved")
		    end if
		  Catch err as RuntimeException
		    System.DebugLog("ERROR : " + err.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setKeys()
		  Dim applicationKey as string = "AAA"
		  Dim clientKey as String = "BBB"
		  
		  NCMB.setKeys(applicationKey, clientKey)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetKeyTest()
		  NCMB.setKeys("aaa", "bbb")
		  Assert.AreEqual("aaa", NCMB.applicationKey)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub updateDataStoreTest()
		  Self.setKeys
		  
		  Dim DataClass as NCMB.DataStore
		  DataClass = new NCMB.DataStore("DataClass")
		  Dim dataItem as NCMB.DataStoreItem =  DataClass.new_data
		  dataItem.set("msg", "Hello")
		  
		  
		  if dataItem.save() then
		    Assert.AreNotEqual(dataItem.objectId, "")
		    System.DebugLog("Saved")
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
