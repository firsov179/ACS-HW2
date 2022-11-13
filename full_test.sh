sh build.sh
sh test.sh
sh gas_test.sh
echo "++++++++++++++++++Test #1++++++++++++++++++"
cmp -s test/test1gas.out test/test1.out && echo Равны
echo "++++++++++++++++++Test #2++++++++++++++++++"
cmp -s test/test2gas.out test/test2.out && echo Равны
echo "++++++++++++++++++Test #3++++++++++++++++++"
cmp -s test/test3gas.out test/test3.out && echo Равны
echo "++++++++++++++++++Test #4++++++++++++++++++"
cmp -s test/test4gas.out test/test4.out && echo Равны
echo "++++++++++++++++++Test #5++++++++++++++++++"
cmp -s test/test5gas.out test/test5.out && echo Равны
echo "++++++++++++++++++Test #6++++++++++++++++++"
cmp -s test/test6gas.out test/test6.out && echo Равны
