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
	Protocols and datasources, reusabled cells, characters table view and update main story board
		ReusableCell.swift 				protocolo: 	celda reutilizable para registrar en un tableview
		CharacterTableCell.swift 		clase: 		adopta el protocolo ReusableCell y crea una celda con nombre e imagen
		CharacterTableCell.xib 			ui: 		interface grafica del diseño de la celda 
		ItemsTableViewDatasource.swift 	protocolo:	define un contrato para datasource externos
		CharactersDatasource 			clase:		adopta el protocolo ItemsTableViewDatasource y configura su tableview, 
													delegado y tableviewcell			 
		Main.storyBoard
			create view characters scene
				associate to view controller
				update ui 
			create view character scene
				associate to view controller
		CharactersViewController.swift
			call api manager to fetch characters and tableview
		Making classes final
	Refactoring MarvelAPI
		func authParameters
		update property task
	update constraints, update cocoapod-keys, running synx
	Added grid to characters view controller, protocols, datasources, reusable cells
		ReusableCell.swift 				protocolo: 	celda reutilizable para registrar en un collectionViewCell
		CharacterCollectionCell.swift 	clase: 		adopta el protocolo ReusableCell y crea una celda con nombre e imagen
		CharacterCollectionCell.xib 	ui: 		interface grafica del diseño de la celda 	
		ItemsCollectionViewDatasource.swift
										protocolo:	define un contrato para datasource externos
		CharactersCollectionDatasource	clase:		adopta el protocolo ItemsCollectionViewDatasource y configura su collectionView, 
													delegado y collectionviewcell 	
		Main.storyBoard 				ui:			add collection view to characters scene
		CharactersViewController.swift 				call api manager to fetch characters, tableview and collectionview
	Add reusable pod for reusing views
		Podfile
	Refactoring cells to use reusable pod. 
		Refactoring also datasources
		Removing old ReusableCell protocol, not needed anymore.	
			CharacterTableCell.swift
			CharacterCollectionCell
			CharactersDatasource
			CharactersCollectionDatasource
	Created extension to uiimage better handling image downloading
		- using kingfisher in a centralized manner
			UIImageView+Kingfisher.swift
			CharacterTableCell
			CharacterCollectionCell
	Implementing delegate click on grid or row should produce the same output
		Main.storyBoard 				ui:			add image and label to character scene
		CharacterViewController 					setup view
		CharactersViewController.swift 				adopt protocol CharactersDelegate
		CharactersCollectionDatasource.swift 		add delegate member
		CharactersDatasource.swift 					add delegate member

		




