import numpy as np
import pandas as pd
import json
import argparse
import re
import os

import matplotlib.pyplot as plt
import seaborn as sns


def plot_curvature(file: str, 
                   out_folder: str) -> None:
    try:
        curv_dict = {}
        with open(file, 'r') as f:
            lines = f.readlines()
            for line in lines:
                line = line.replace("\'", '\"')
                if 'Stopped' in line:
                    break
                m = re.search(r'\{.*\}', line)
                if m is None:
                    continue
                line = m.group(0)
                dic = json.loads(line)
                for key in dic.keys():
                    if 'curvature' in key:
                        if key not in curv_dict.keys():
                            curv_dict[key] = []
                        curv_dict[key].append(dic[key])

        vals = list(curv_dict.values())
        curv_dict['run'] = range(len(vals[0]))

        for key in curv_dict.keys():
            print(f'{key}: {len(curv_dict[key])}')
        curv_df = pd.DataFrame(curv_dict)
        curv_df = curv_df.set_index('run')

        name = file.split('/')[-1].split('.')[0]
        path = os.path.join(out_folder, f'{name}.png')

        plt.figure()
        sns.lineplot(curv_df)
        plt.savefig(path)
        print('Saved figure')
        # plt.show()
        plt.close()
    except:
        print('Error')
        pass

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dataset', type = str, required = True)
    parser.add_argument('--logdir', type = str, default = './log')
    parser.add_argument('--outdir', type = str, default = './plots')
    args = parser.parse_args()

    for file in os.listdir(args.logdir):
        if args.dataset in file:
            print(f'Data file: {file}')
            plot_curvature(os.path.join(args.logdir, file), args.outdir)

if __name__ == '__main__':
    main()
