
package com.practices.schedule.utils;

import java.io.Serializable;
import java.util.concurrent.atomic.AtomicInteger;

/**
 *
 * @author pbutron
 */
public final class Counter implements Serializable{
    
    private static final long serialVersionUID = 1;
    
    private static final int COMPARE_EXPECTED = 64000;
    private static Counter instance = null;
    private final AtomicInteger counter = new AtomicInteger(0);

    private Counter() {      
    }

    public static synchronized Counter getInstance() {
       if(instance == null) {
          instance = new Counter();
       }
       return instance;
    }

    public int getCounter() {
        counter.compareAndSet(COMPARE_EXPECTED, 0);
        
        return counter.incrementAndGet();
    }   
}

