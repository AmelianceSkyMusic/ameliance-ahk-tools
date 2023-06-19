#include helpers\__generateMenu.ahk

CreateMenu(menuFolderpath){
	configFilePath := menuFolderpath 'menu.json'
	menuData := JSON.parse(FileRead(configFilePath))
	menuArray := menuData['menu']

	generatedMenu := __generateMenu(menuFolderpath, menuArray)
	return generatedMenu
}
