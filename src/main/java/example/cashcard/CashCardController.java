package example.cashcard;

import example.cashcard.entity.CashCard;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.security.Principal;
import java.util.List;

/**
 * @author dungptm
 */
@RestController
@RequestMapping("/cashcards")
public class CashCardController {

    private final CashCardRepository cashCardRepository;

    public CashCardController(CashCardRepository cashCardRepository) {
        this.cashCardRepository = cashCardRepository;
    }

    @GetMapping("/{requestId}")
    private ResponseEntity<CashCard> findById(@PathVariable Long requestId, Principal principal) {
        CashCard cashCard = findCashCard(requestId, principal);
        if (cashCard == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(cashCard);
    }

    @PostMapping
    private ResponseEntity<Void> createCashCard(@RequestBody CashCard cashCard, UriComponentsBuilder uriBuilder, Principal principal) {
        CashCard cashCardWithOwner = new CashCard(null, cashCard.getAmount(), principal.getName());
        CashCard savedCashCard = cashCardRepository.save(cashCardWithOwner);
        URI locationOfNewCashCard = uriBuilder
                .path("cashcards/{id}")
                .buildAndExpand(savedCashCard.getId())
                .toUri();
        return ResponseEntity.created(locationOfNewCashCard).build();
    }

    @GetMapping
    private ResponseEntity<List<CashCard>> findAll(Pageable pageable, Principal principal) {
        Page<CashCard> page = cashCardRepository.findByOwner(principal.getName(),
                PageRequest.of(
                        pageable.getPageNumber(),
                        pageable.getPageSize(),
                        pageable.getSortOr(Sort.by(Sort.Direction.ASC, "amount"))));
        return ResponseEntity.ok(page.getContent());
    }

    @PutMapping("/{requestId}")
    private ResponseEntity<Void> putCashCard(@PathVariable Long requestId, @RequestBody CashCard cashCardUpdate, Principal principal) {
        CashCard cashCard = findCashCard(requestId, principal);
        if (cashCard == null) {
            return ResponseEntity.notFound().build();
        }
        CashCard updatedCashCard = new CashCard(cashCard.getId(), cashCardUpdate.getAmount(), principal.getName());
        cashCardRepository.save(updatedCashCard);
        return ResponseEntity.noContent().build();
    }

    private CashCard findCashCard(Long requestId, Principal principal) {
        return cashCardRepository.findByIdAndOwner(requestId, principal.getName());
    }

    @DeleteMapping("/{id}")
    private ResponseEntity<Void> deleteCashCard(@PathVariable Long id, Principal principal) {
        if (!cashCardRepository.existsByIdAndOwner(id, principal.getName())) {
            return ResponseEntity.notFound().build();
        }
        cashCardRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
