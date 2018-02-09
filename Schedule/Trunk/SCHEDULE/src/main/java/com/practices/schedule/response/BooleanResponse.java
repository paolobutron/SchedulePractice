
package com.practices.schedule.response;

/**
 *
 * @author pbutron
 */
public class BooleanResponse {

    protected int errorCode;
    protected String message;

    public BooleanResponse(int errorCode, String message) {
        this.errorCode = errorCode;
        this.message = message;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
