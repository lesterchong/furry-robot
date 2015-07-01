/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import MODEL.StaffModel;
import java.util.Comparator;

/**
 *
 * @author Lester Chong
 */
public class StaffComparator implements Comparator{

    @Override
    public int compare(Object o1, Object o2) {
        StaffModel model1 = (StaffModel)o1;
        StaffModel model2 = (StaffModel)o2;
        return model1.getPatientCount() - model2.getPatientCount();
    }
    
}
