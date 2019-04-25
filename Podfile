# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'GithubViewer.xcworkspace'
abstract_target 'App' do 
  platform :ios, '9.0'
  use_frameworks!

  pod 'RxSwift',      '~> 4.0'
  pod 'RxCocoa',      '~> 4.0'

  target 'GithubViewer' do
    pod 'Swinject',   '~> 2.0'
  
    target 'GithubViewerTests' do
      inherit! :search_paths
      pod 'RxBlocking', '~> 4.0'
      pod 'RxTest',     '~> 4.0'
    end
  
    target 'GithubViewerUITests' do
      inherit! :search_paths
      # Pods for testing
    end
  
  end
  
  target 'Search' do 
    project 'Feature/Search/Search.xcodeproj'
    target 'SearchTests' do 
      pod 'RxBlocking', '~> 4.0'
      pod 'RxTest',     '~> 4.0'
    end 
  end

  target 'Favorite' do 
    project 'Feature/Favorite/Favorite.xcodeproj'
    target 'FavoriteTests' do 
      pod 'RxBlocking', '~> 4.0'
      pod 'RxTest',     '~> 4.0'
    end 
  end

  target 'GithubAPI' do 
    project 'Common/GithubAPI/GithubAPI.xcodeproj'
    target 'GithubAPITests' do 
      pod 'RxBlocking', '~> 4.0'
      pod 'RxTest',     '~> 4.0'
    end 
  end

  
end
