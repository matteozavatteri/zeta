import os
import sys
import statistics

minO=2
maxO=6

Data = dict()

Data['weak'] = dict()
Data['strong'] = dict()
Data['dynamic'] = dict()
Data['uncontrollable'] = dict()

# Loading data
for bench_dir in ['weak', 'strong', 'dynamic', 'uncontrollable']:
    for n in range(minO,maxO+1):
        Data[bench_dir][n] = dict()
        Data[bench_dir][n] = dict()
        for synth_alg in ['weak','strong','dynamic']:
            Data[bench_dir][n][synth_alg] = dict()
            f = open(bench_dir+"/6vars/"+str(n)+"obs."+synth_alg+".v","r")
            for line in f:
                (cncu,result,timeC,timeD,space) = line.split()
                if bench_dir == "weak":
                    if synth_alg == "weak":
                        assert result == "1"
                    else:
                        if result != "0":
                            print(bench_dir+"/6vars/"+str(n)+"obs/" + str(cncu) + " DC")
                
                if bench_dir == "strong":
                        assert result == "1"

                if bench_dir == "dynamic":
                    if synth_alg in {"weak","dynamic"}:
                        assert result == "1"
                    else:
                        assert result == "0"

                if bench_dir == "uncontrollable":
                    assert result == "0"
                Data[bench_dir][n][synth_alg][cncu] = dict()
                Data[bench_dir][n][synth_alg][cncu]['time'] = float(timeC) + float(timeD)
                Data[bench_dir][n][synth_alg][cncu]['space'] = int(space)
            f.close()
            if (bench_dir == "weak" and synth_alg == "weak") or bench_dir == "strong" or (bench_dir == "dynamic" and synth_alg != "strong"):
                f = open(bench_dir+"/6vars/"+str(n)+"obs."+synth_alg+".x","r")
                for line in f:
                    (cncu,result,timeC,timeD,space) = line.split()
                    assert result == "1"
                f.close()

# Computing stats
for bench_dir in ['weak', 'strong', 'dynamic', 'uncontrollable']:
    f1 = open(bench_dir+".time","w")
    f2 = open(bench_dir+".space","w")
    for n in range(minO,maxO+1):
        f1.write(str(n) + " ")
        f2.write(str(n) + " ")

        for synth_alg in ['weak','strong','dynamic']:
            AvgTime = statistics.mean([Data[bench_dir][n][synth_alg][cncu]['time'] for cncu in Data[bench_dir][n][synth_alg]])
            AvgTime = float(AvgTime / 1000)
            f1.write(str(AvgTime) + " ")
            AvgSpace = statistics.mean([Data[bench_dir][n][synth_alg][cncu]['space'] for cncu in Data[bench_dir][n][synth_alg]])
            AvgSpace = 2 * (2 * AvgSpace + 2)
            f2.write(str(AvgSpace) + " ")
        f1.write("\n")
        f2.write("\n")
    f1.close()
    f2.close()
