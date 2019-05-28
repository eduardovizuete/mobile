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


