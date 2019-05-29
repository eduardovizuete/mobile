Marvel Ios App from scratch	
	Initial commit
		files
			.gitignore
			README.md
	Creating initial project structure
		create new xcode project IOS - Single View App
	Setup init cocoapods
		pod init
		update Podfile
		pod install
	Creating initial view controllers
		CharacterViewController.swift
		CharactersViewController.swift
	Adjusting folders structure
	    ├── marvelapp_start                                                      
	    │   ├── AppDelegate                                                           
	    │   │   └── AppDelegate.swift                                                 
	    │   ├── Base.lproj                                                            
	    │   ├── Controllers                                                           
	    │   │   ├── CharacterViewController.swift                                     
	    │   │   └── CharactersViewController.swift                                    
	    │   ├── Resources                                                             
	    │   │   ├── Assets.xcassets                                                   
	    │   │   │   ├── AppIcon.appiconset                                            
	    │   │   │   │   └── Contents.json                                             
	    │   │   │   └── Contents.json                                                 
	    │   │   └── Info.plist                                                        
	    │   └── Storyboards                                                           
	    │       ├── LaunchScreen.storyboard                                           
	    │       └── Main.storyboard
	Running synx
		command-line tool that reorganizes your Xcode project folder to Xcode groups
		sudo gem install synx
		synx path/to/my/marvelapp_start.xcodeproj
		pod install
	Adding pods to handle api, crypto needs from api, objectMapper for mapping, dollar for functional programming
		pods:	RxSwift, 
  				Moya/RxSwift
  				Moya-ObjectMapper/RxSwift
  				CryptoSwift
 	 			Dollar
 	 	sudo gem install cocoapods-keys
 	 	pod install
 	 		CocoaPods-Keys has detected a keys mismatch for your setup
 	 		What is the key for MarvelApiKey   
 				> 
			Saved MarvelApiKey to Marvel. 
			What is the key for MarvelPrivateKey
 				> 
 	Create model class
 		Character.swift
 	Create api with moya/rxswift, using cocoapods-keys to handle sensitive data, 
 	and Dollar pod to functional programming
 		MarvelApi.swift (Moya target)
 		MarvelAPIManager (Moya provider)
 	Project changes and running sync
 		update CharactersViewController for use apiManager
 		create folders models and network
 		reorganize files in folders
 		Running synx
 			synx path/to/my/marvelapp_start.xcodeproj
			pod install
	Spliting models into diferent classes, added method to get full path
		Character.swift
		ThumbImage.swift
	Add new pod Kingfisher for downloading and caching images
		Podfile
	Transport security allow http requests, needed for image download
		Info.plist




