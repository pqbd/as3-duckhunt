import alx.common.test.*;
import test.alx.duckhunt.CVector2fTest;
import test.alx.duckhunt.CDuckTargetTest;
import test.alx.duckhunt.CCloudTargetTest;
import test.alx.duckhunt.CDuckTargetFactoryTest;
import test.alx.duckhunt.CCloudTargetFactoryTest;
import test.alx.duckhunt.CRandomTargetFactoryTest;
import test.alx.duckhunt.CTargetEmitterTest;
import test.alx.duckhunt.CSniperRifleMagazineTest;
import test.alx.duckhunt.CSniperRifleTest;
import test.alx.duckhunt.CStatisticTest;
import test.alx.duckhunt.CNickGeneratorTest;
import test.alx.duckhunt.CDisplayTest;
import test.alx.duckhunt.CRoundTest;

// refactoring
//CUnitTests.init( CTester, CUnitTests.SIMPLE_MODE, true);
// development
//CUnitTests.init( CTester, CUnitTests.EXTENDED_MODE, true);
//CUnitTests.init( CTester, CUnitTests.FULL_MODE, true);
CUnitTests.init( CTester, CUnitTests.FULL_MODE, false);

CUnitTests.run( CVector2fTest
              , CDuckTargetTest
              , CCloudTargetTest
              , CDuckTargetFactoryTest
              , CCloudTargetFactoryTest
              , CRandomTargetFactoryTest
              , CTargetEmitterTest
              , CSniperRifleMagazineTest
              , CSniperRifleTest
              , CStatisticTest
              , CNickGeneratorTest
              , CDisplayTest
              , CRoundTest
              );
CUnitTests.printResult( root);