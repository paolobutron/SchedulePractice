

package com.practices.schedule.model;

import java.io.Serializable;

/**
 *
 * @author pbutron
 */
public class ClassInformation implements Serializable {

    private String classCode;
    private String title;
    private String description;

    public ClassInformation() {
        this.classCode = "";
        this.title = "";
        this.description = "";
    }

    public ClassInformation(String classCode, String title, String description) {
        this.classCode = classCode;
        this.title = title;
        this.description = description;
    }

    public String getClassCode() {
        return classCode;
    }

    public void setClassCode(String classCode) {
        this.classCode = classCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
