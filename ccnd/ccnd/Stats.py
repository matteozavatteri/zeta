import os
import sys
import statistics

minOD=1
maxOD=4

Data = dict()

Data['weak'] = dict()
Data['strong'] = dict()
Data['dynamic'] = dict()
Data['uncontrollable'] = dict()

# Loading data
for bench_dir in ['weak', 'strong', 'dynamic', 'uncontrollable']:
    for n in range(minOD,maxOD+1):
        Data[bench_dir][n] = dict()
        Data[bench_dir][n] = dict()
        for synth_alg in ['weak','strong','dynamic']:
            Data[bench_dir][n][synth_alg] = dict()
            f = open(bench_dir+"/8vars/"+str(n)+"o"+str(n)+"d."+synth_alg+".v","r")
            for line in f:
                (ccnd,result,timeC,timeD,space) = line.split()
                if bench_dir == "weak":
                    if synth_alg == "weak":
                        assert result == "1"
                    else:
                        assert result == "0"
                
                if bench_dir == "strong":
                        assert result == "1"

                if bench_dir == "dynamic":
                    if synth_alg in {"weak","dynamic"}:
                        assert result == "1"
                    else:
                        assert result == "0"

                if bench_dir == "uncontrollable":
                    assert result == "0"
                Data[bench_dir][n][synth_alg][ccnd] = dict()
                Data[bench_dir][n][synth_alg][ccnd]['time'] = float(timeC) + float(timeD)
                Data[bench_dir][n][synth_alg][ccnd]['space'] = int(space)
            f.close()
            if (bench_dir == "weak" and synth_alg == "weak") or bench_dir == "strong" or (bench_dir == "dynamic" and synth_alg != "strong"):
                f = open(bench_dir+"/8vars/"+str(n)+"o"+str(n)+"d."+synth_alg+".x","r")
                for line in f:
                    (ccnd,result,timeC,timeD,space) = line.split()
                    assert result == "1"
                f.close()

# Computing stats
for bench_dir in ['weak', 'strong', 'dynamic', 'uncontrollable']:
    f1 = open(bench_dir+".time","w")
    f2 = open(bench_dir+".space","w")
    for n in range(minOD,maxOD+1):
        f1.write(str(n) + " ")
        f2.write(str(n) + " ")

        for synth_alg in ['weak','strong','dynamic']:
            AvgTime = statistics.mean([Data[bench_dir][n][synth_alg][ccnd]['time'] for ccnd in Data[bench_dir][n][synth_alg]])
            f1.write(str(AvgTime) + " ")
            AvgSpace = statistics.mean([Data[bench_dir][n][synth_alg][ccnd]['space'] for ccnd in Data[bench_dir][n][synth_alg]])
            f2.write(str(AvgSpace) + " ")
        f1.write("\n")
        f2.write("\n")
    f1.close()
    f2.close()
