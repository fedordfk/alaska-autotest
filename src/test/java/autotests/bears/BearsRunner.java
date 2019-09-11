package autotests.bears;

import com.intuit.karate.junit5.Karate;

class BearsRunner {
    
    @Karate.Test
    Karate testUsers() {
        return new Karate().feature("bears").relativeTo(getClass());
    }    

}
