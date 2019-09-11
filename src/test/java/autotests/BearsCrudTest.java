package autotests;

import com.intuit.karate.junit5.Karate;

class BearsCrudTest {
    @Karate.Test
    Karate testAll() {
        return new Karate().relativeTo(getClass());
    }
    
}
