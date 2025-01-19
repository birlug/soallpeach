from typing import Union
from requests import session, Session, Response

from models import ChallengeResult, ChallengeResult2, ChallengeError

def report(nickname: str, challenge_name: str, run_id: str, result: Union[ChallengeResult, ChallengeError]):
    return {
        'nickname': nickname,
        'challenge_name': challenge_name,
        'run_id': run_id,
        'result': result,
        'state': 'PASSED' if isinstance(result, ChallengeResult2) else 'FAILED'
    }
