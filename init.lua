local moduleFolder = ('.'..(...)) :gsub('%.init$', '')
return require((moduleFolder..'.Gui'):sub(2))
