/*
 * Author: CPL.Brostrom.A
 * This function is used to handle player premissions
 *
 * Arguments:
 * 0: Player <STRING>
 * 1: Platoon <STRING>
 * 2: MedicClass <NUMBER> (Optional) (Default; 0)
 * 3: Engineer <BOOL> (Optional) (Default; 0)
 * 4: EOD <BOOL> (Optional) (Default; 0)
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [this] call cScripts_fnc_setPreInitPlayerSettings;
 * [this, "charlie",0] call cScripts_fnc_setPreInitPlayerSettings;
 * [this, "charlie",0,false,false] call cScripts_fnc_setPreInitPlayerSettings;
 *
 */
#include "..\script_component.hpp";

params [
    ["_player",""],
    ["_setPlatoon",""],
    ["_isMedicClass", 0],
    ["_isEngineer", false],
    ["_isEOD", false]
];

#ifdef DEBUG_MODE
    [formatText["Applying preLoadout to %1.", _player]] call FUNC(logInfo);
#endif

// Set platoonVariables
(_player) setVariable [QGVAR(7cav_Trooper), true];
(_player) setVariable [QGVAR(7cav_Platoon), _setPlatoon];

// Set MedicClass
private _MedicClass = if (_isMedicClass > 1) then {true} else {false};
(_player) setVariable ["ACE_medical_medicClass", _isMedicClass, _MedicClass];

// Set Engineer
(_player) setVariable ["ACE_isEngineer", _isEngineer];

// Set EOD capable
(_player) setVariable ["ACE_isEOD", _isEOD];

#ifdef DEBUG_MODE
    [formatText["preLoadout application completed for %1.", _player]] call FUNC(logInfo);
#endif
