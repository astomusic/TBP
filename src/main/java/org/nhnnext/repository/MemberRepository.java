package org.nhnnext.repository;

import org.nhnnext.web.Member;
import org.springframework.data.repository.CrudRepository;

public interface MemberRepository extends CrudRepository<Member, Long> {

}