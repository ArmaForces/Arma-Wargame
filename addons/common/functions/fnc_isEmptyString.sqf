#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Example function checking if string is empty.
 *
 * Arguments:
 * 0: String to check <STRING>
 *
 * Return Value:
 * True if string is null or empty <BOOL>
 *
 * Example:
 * [nil] call NEW_MOD_ABBR_common_fnc_isEmptyString
 *
 * Public: No
 */

params [["_string", ""]];

if (_string isEqualTo "") exitWith { true };

false
