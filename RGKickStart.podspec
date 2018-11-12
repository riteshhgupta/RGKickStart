Pod::Spec.new do |spec|
  spec.name         =  'RGKickStart'
  spec.version      =  '1.0'
  spec.summary      =  'Kick start extension to support RGx components'
  spec.author       =  { 'Ritesh Gupta' => 'rg.riteshh@gmail.com' }
  spec.license      =  'MIT' 
  spec.homepage     =  'https://github.com/riteshhgupta/RGKickStart'
  spec.requires_arc =  true
  spec.ios.deployment_target = "11.0"
  
  spec.source = {
    :git => 'https://github.com/riteshhgupta/RGKickStart.git',
    :tag => '1.0'
  }
  
  spec.subspec 'Core' do |core|
    core.source_files =  'Source/**/*.swift'
  end

  spec.default_subspec = 'Core'
end
