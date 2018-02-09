
package com.practices.schedule.response;

import com.practices.schedule.model.ClassInformation;
import java.util.List;

/**
 *
 * @author pbutron
 */
public class ClassesResponse extends BooleanResponse {
    
    private List<ClassInformation> classesList;

    public ClassesResponse(int errorCode, String message) {
        super(errorCode, message);
    }

    public List<ClassInformation> getClassesList() {
        return classesList;
    }

    public void setClassesList(List<ClassInformation> classesList) {
        this.classesList = classesList;
    }
    
}
