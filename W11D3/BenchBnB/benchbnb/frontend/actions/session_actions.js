import {logIn, logOut, signUp} from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

const receiveCurrentUser = user => ({
    type: RECEIVE_CURRENT_USER,
    user,
});

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
});

const receiveErrors = (errors) => {
    debugger
    return {
    type: RECEIVE_ERRORS,
    errors,
}};

export const signup = user => dispatch => signUp(user).then(user => dispatch(receiveCurrentUser(user)), errors => dispatch(receiveErrors(errors.responseJSON)));

export const login = user => dispatch => logIn(user).then(user => dispatch(receiveCurrentUser(user)), errors=> dispatch(receiveErrors(errors.responseJSON)));

export const logout = () => dispatch => logOut().then(() => dispatch(logoutCurrentUser()));


