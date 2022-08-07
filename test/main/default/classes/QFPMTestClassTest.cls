@IsTest private class QFPMTestClassTest {
    @IsTest static void qnotTest(){
      System.assertEquals(true, QFPMTestClass.qnot(null));
      System.assertEquals(false, QFPMTestClass.qnot(true));
      System.assertEquals(true, QFPMTestClass.qnot(false));
    }
}
