import os

from pprint import pprint


def test_mtxmult_output(prog_out_fpath: str, expected_out_fpath: str) -> bool:
    """Tests if the MatMult procedure outputs the correct multiplied matrix."""

    prog_out_fpath = os.path.abspath(prog_out_fpath)
    expected_out_fpath = os.path.abspath(expected_out_fpath)

    assert os.path.exists(prog_out_fpath)
    assert os.path.exists(expected_out_fpath)

    with open(prog_out_fpath, 'r') as output:
        got_data = output.read().replace('\n', ' ').split()

    with open(expected_out_fpath, 'r') as expected:
        expected_data = expected.read().replace('\n', ' ').split()

    print(f'\nExpected output: \n\t{expected_data}')
    print(f'\nGot output: \n\t{got_data}')

    assert got_data == expected_data

    print('\nExpected output matches got output. Test successful!\n')


if __name__ == '__main__':
    test_mtxmult_output(
        prog_out_fpath='test/prog_out.txt',
        expected_out_fpath='test/expected_out.txt'
    )
