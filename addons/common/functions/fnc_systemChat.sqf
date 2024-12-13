#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Example function printing sytemChat message.
 *
 * Arguments:
 * 0: Actual message <STRING>
 *
 * Return Value:
 * True if message was printed <BOOL>
 *
 * Example:
 * ["Test message"] call NEW_MOD_ABBR_common_fnc_systemChat
 *
 * Public: No
 */

params [["_message", ""]];

if (_message call FUNC(isEmptyString)) exitWith { false };

sytemChat _message;

true
